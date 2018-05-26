class Questionset < ApplicationRecord
  belongs_to :User
  belongs_to :Genre
  belongs_to :Subgenre
end
