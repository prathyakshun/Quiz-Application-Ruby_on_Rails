class CreateSubgenres < ActiveRecord::Migration[5.1]
  def change
    create_table :subgenres do |t|
      t.text :subgenrename
      t.references :Genre, foreign_key: true

      t.timestamps
    end
  end
end
