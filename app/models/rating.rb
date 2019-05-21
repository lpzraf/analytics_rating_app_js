class Rating < ApplicationRecord

  belongs_to :student
  belongs_to :course

  validates :rating,
            #uniqueness: true,
            numericality: { less_than_or_equal_to: 5,
            greater_than: 0,
            only_integer: true }


    def self.average_rating
        average(:rating).round(2)
    end
end
