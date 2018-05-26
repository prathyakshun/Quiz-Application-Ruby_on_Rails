class Subgenre < ApplicationRecord
  belongs_to :Genre
  has_many :questions
  has_many :questionsets

  def name
  	subgenrename
  end
end
