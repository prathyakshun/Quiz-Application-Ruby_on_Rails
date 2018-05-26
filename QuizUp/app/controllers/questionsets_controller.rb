class QuestionsetsController < ApplicationController
  before_action :set_questionset, only: [:show, :edit, :update, :destroy]

  # GET /questionsets
  # GET /questionsets.json
  def index
    @questionsets = Questionset.all
  end

  # GET /questionsets/1
  # GET /questionsets/1.json
  def show
  end

  # GET /questionsets/new
  def new
    @questionset = Questionset.new
  end

  # GET /questionsets/1/edit
  def edit
  end

  # POST /questionsets
  # POST /questionsets.json
  def create
    @questionset = Questionset.new(questionset_params)

    respond_to do |format|
      if @questionset.save
        format.html { redirect_to @questionset, notice: 'Questionset was successfully created.' }
        format.json { render :show, status: :created, location: @questionset }
      else
        format.html { render :new }
        format.json { render json: @questionset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionsets/1
  # PATCH/PUT /questionsets/1.json
  def update
    respond_to do |format|
      if @questionset.update(questionset_params)
        format.html { redirect_to @questionset, notice: 'Questionset was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionset }
      else
        format.html { render :edit }
        format.json { render json: @questionset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionsets/1
  # DELETE /questionsets/1.json
  def destroy
    @questionset.destroy
    respond_to do |format|
      format.html { redirect_to questionsets_url, notice: 'Questionset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionset
      @questionset = Questionset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionset_params
      params.require(:questionset).permit(:number_correct, :User_id, :Genre_id, :Subgenre_id)
    end
end
