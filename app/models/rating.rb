class Rating < ApplicationRecord
  belongs_to :student
  belongs_to :course

  validates :rating,
            presence: true
            #length: { maximum: 5 } validate min and max do not use length do numericality 
end
