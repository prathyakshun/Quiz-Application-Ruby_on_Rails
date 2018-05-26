class CreateQuestionsets < ActiveRecord::Migration[5.1]
  def change
    create_table :questionsets do |t|
      t.integer :number_correct
      t.references :User, foreign_key: true
      t.references :Genre, foreign_key: true
      t.references :Subgenre, foreign_key: true
      t.integer :fiftyfifty
      t.integer :doubledip
      t.integer :completed
      
      t.timestamps
    end
  end
end
