	class Question < ApplicationRecord
  belongs_to :Genre
  belongs_to :Subgenre
  has_many :options
  
  def name
  	questiontext
  end
end
