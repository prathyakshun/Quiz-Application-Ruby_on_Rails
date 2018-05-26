class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :questiontext
      t.references :Genre, foreign_key: true
      t.references :Subgenre, foreign_key: true
      t.integer :qtype
	  t.text :image_url      

      t.timestamps
    end
  end
end
