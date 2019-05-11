class Rating < ActiveRecord::Base
  belongs_to :course
  belongs_to :student

  #new
  # validates :rating, presence: true
  # validates :rating, numericality: {
  #   only_integer: true,
  #   greater_than_or_equal_to: 1,
  #   less_than_or_equal_to: 5,
  #   message: "Can only be a number between 1 and 5"
  # }
end
