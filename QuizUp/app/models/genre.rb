class Genre < ApplicationRecord
	has_many :subgenres
	has_many :questions
	has_many :questionsets

	def name
		genrename
	end
end
