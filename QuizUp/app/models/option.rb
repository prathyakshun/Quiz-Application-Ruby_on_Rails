class Option < ApplicationRecord
  belongs_to :Question

  def name
  	optiontext
  end
end
