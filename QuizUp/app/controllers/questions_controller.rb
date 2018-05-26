
class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:landingpage, :leaderboard, :leaderboardsubcategory, :subleaderboard, :redirectsubleaderboard, :redirectleaderboardsubcategory] 
  # GET /questions
  # GET /questions.json
  $questioncount = 0
  $qid = []
  $correct = []
  $answered = 0

  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @options = @question.options
  end

  def category
    @category = Genre.all
    @categoryarr = []
    @category.each do |d|
      arr = []
      arr.push(d.genrename)
      arr.push(d.id.to_int)
      @categoryarr.push(arr)
    end
  end

  def redirectsubcategory
    # Redirect to subcategory
    $genreid = params[:categorydrop]
    redirect_to subcategory_path
  end

  def redirectdisplayquestions
    #redirect to displayquestions
    $subgenreid = params[:subcategorydrop]
    redirect_to check_incomplete_path
  end

  def redirectleaderboardsubcategory
    #redirect to leaderboardsubcategory
    $genreid = params[:categorydrop]
    redirect_to leaderboardsubcategory_path
  end

  def redirectsubleaderboard
    #redirect to subleaderboard
    $subgenreid = params[:subcategorydrop]
    print("subgenreid is ")
    puts($subgenreid)
    redirect_to subleaderboard_path
  end

  def leaderboard
    # TO get the leaderboard of the game
    @category = Genre.all
    @categoryarr = []
    @category.each do |d|
      arr = []
      arr.push(d.genrename)
      arr.push(d.id.to_int)
      @categoryarr.push(arr)
    end
  end

  def leaderboardsubcategory
    # => To get the leaderboard for each subcategory
    @myhash = {}
    @myhasharr = []
    questionsetquery = Questionset.where(Genre_id:$genreid)
    @useridarr = questionsetquery.all.uniq.pluck(:User_id).uniq
    correct = 0
    @useridarr.each do |d|
      qquery = questionsetquery.where(User_id: d)
      correct = 0
      qquery.each do |b|  
        correct = correct + b.number_correct
      end
      @myhash[correct] = d
    end
    @myhasharr = @myhash.sort.reverse
    @subcategory  = Subgenre.all
    @subcategory = @subcategory.where(Genre_id:$genreid) 
    @subcategoryarr = []
    @subcategory.each do |d|
      arr = []
      arr.push(d.subgenrename)
      arr.push(d.id.to_int)
      @subcategoryarr.push(arr)
    end
  end

  def subleaderboard
    # => To show the leaderboard for subcategory
    $genreid
    @myhash = {}
    @myhasharr = []
    questionsetquery = Questionset.where(Genre_id:$genreid)
    questionsetquery = questionsetquery.where(Subgenre_id:$subgenreid)
    @useridarr = questionsetquery.all.uniq.pluck(:User_id).uniq
    correct = 0
    @useridarr.each do |d|
      qquery = questionsetquery.where(User_id: d)
      correct = 0
      qquery.each do |b|  
        correct = correct + b.number_correct
      end
      @myhash[correct] = d
    end
    @myhasharr = @myhash.sort.reverse
  end

  def subcategory
    # => To get the subcategory
    @subcategory  = Subgenre.all
    @subcategory = @subcategory.where(Genre_id:$genreid) 
    @subcategoryarr = []
    @subcategory.each do |d|
      arr = []
      arr.push(d.subgenrename)
      arr.push(d.id.to_int)
      @subcategoryarr.push(arr)
    end
  end

  def pastquiz
    # => To get details about the past quiz
    @userquizquery = Questionset.all.where(User_id:current_user.id)
  end

  def landingpage
    # => To go the landing page in case of user and to admin page in case of admin
    if current_user.try(:admin?)
      redirect_to '/admin'
    end
  end

  def subgenrequiz
  end

  def result
    # => To get the result when quiz is over
    countone = 0
    countzero = 0
    $userquizobj
    @line_chart = Gchart.line(:data => $correct, :title => "Your progress", :legend => "How you proceeded", :min_value => 0, :maxvalue => 1)
    $correct.each do |d|
      if d == 1
        countone = countone + 1
      end
      if d == 0
        countzero = countzero + 1
      end
    end
    @piearray = [countone, countzero]
    @pie_chart = Gchart.pie(:data => @piearray,:legend => "Correct", :title => "Piechart progress", :axis_labels => [["correct|incorrect"]])
  end

  def displayquestions
    # => To display the questions
    $userquizobj
    if ($answered == 1)
      $answered = 0
      $qid.shift
    else
      @question = Question.find($qid[0])
      @options = @question.options
      if $usefifty == 1 || $usefifty==2
        $usefifty = 2
      elsif $usedouble == 1 || $usedouble==2
        $usedouble = 2
      else
        $usefifty = 0
        $usedouble = 0
      end
      return
    end
    if $usefifty == 1
      $usefifty = 2
    elsif $usedouble == 1
      $usedouble = 2
    else
      $usefifty = 0
      $usedouble = 0
      if $qid.empty?
        redirect_to result_path
        return
      end
      $questionid = $qid[0]
    end
    @question = Question.find($questionid)
    puts("Display Question")
    puts($questionid)
    @options = @question.options
  end

  def check_incomplete
    # => To check if already a given quiz exists
    $userquizobj = Questionset.where(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid)[0]
    $flag = 1
    if Questionset.where(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid).blank? != true
      if Questionset.where(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid)[0].completed < Question.where(Genre_id: $genreid, Subgenre_id: $subgenreid).count
        $flag = -1
      else
        $flag = 2
      end
    else
      redirect_to getquestions_path
    end
  end

  def getquestions
    # => To get questions when already given quiz exists
    puts($genreid)
    puts($subgenreid)
    done = 0
    if Questionset.where(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid).blank? != true
      if Questionset.where(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid)[0].completed < Question.where(Genre_id: $genreid, Subgenre_id: $subgenreid).count
        done = Questionset.where(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid)[0].completed
      else
        Questionset.where(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid).destroy_all
        $correct = []
        $userquizobj = Questionset.create(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid, number_correct: 0, fiftyfifty:2, completed:0, doubledp:1)
      end
    else
      $correct = []
      $userquizobj = Questionset.create(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid, number_correct: 0, fiftyfifty:2, completed:0, doubledip:1)
    end
    @questionquery = Question.where(Genre_id:$genreid)
    @questionquery = @questionquery.where(Subgenre_id:$subgenreid)
    puts("DONE")
    puts(done)
    $qid = @questionquery.map(&:id)
    i = 0
    while i<done
      $qid.shift
      i=i+1
    end
    print($qid)
    redirect_to displayquestions_path
  end

  def getfreshquestions
    # => To get fresh questions fora sub category
    $correct = []
    Questionset.where(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid).destroy_all
    $userquizobj = Questionset.create(User_id: current_user.id, Genre_id: $genreid, Subgenre_id: $subgenreid, number_correct: 0, fiftyfifty:2, completed:0, doubledip:1)
    @questionquery = Question.where(Genre_id:$genreid)
    @questionquery = @questionquery.where(Subgenre_id:$subgenreid)
    $qid = @questionquery.map(&:id)
    redirect_to displayquestions_path
  end


  def fiftyfifty
    # => Fifty fifty powerup
    puts("Fifty")
    puts("$userquizobj.fiftyfifty")
    $userquizobj.fiftyfifty = $userquizobj.fiftyfifty - 1
    $userquizobj.save
    $usefifty = 1
    redirect_to displayquestions_path
  end

  def doubledip
    # => Multi-dip powerup
    puts("Double")
    $userquizobj.doubledip = 0
    $userquizobj.save
    $usedouble = 1
    redirect_to displayquestions_path
  end

  def check_correct
    # => Check if answer is correct after user response
    @ans = "correct"
    countwrong = 0
    @optid = params[:ques]
    puts("optid is ")
    puts(@optid)
    @ques = Option.find(params[:ques][0]).Question
    if $usedouble!=2
      @ques.options.each do |d|
        if @optid.include? d.id.to_s
          if d.correct == false 
            @ans = "incorrect"
          end
        else
          if d.correct == true
            @ans = "incorrect"
          end
        end
      end
    else
      @ques.options.each do |d|
        if @optid.include? d.id.to_s
          if d.correct == false
            countwrong = countwrong+1
          end
          if d.correct == true
            @ans = "partial_correct"
          end
        else
          if d.correct == true
            @ans = "incorrect"
          end
        end
      end
    end
    if @ans == "correct"
      $userquizobj.number_correct = $userquizobj.number_correct + 10
      $userquizobj.save
      puts("Hey it is correct")
      puts($userquizobj.number_correct)
      $correct.push(1)
    elsif @ans == "partial_correct"
      $userquizobj.number_correct = $userquizobj.number_correct + 10 - (countwrong*3)
      $userquizobj.save
      $correct.push(1)
    else
      $correct.push(0)
    end
    $userquizobj.completed = $userquizobj.completed + 1
    $userquizobj.save  
    puts(params[:ques])
    puts("hello!")
  end


  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:questiontext, :Genre_id, :Subgenre_id, :qtype)
    end
end
