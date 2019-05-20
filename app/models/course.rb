class Course < ActiveRecord::Base
  self.per_page = 3

  has_many :ratings
  has_many :students, through: :ratings
  has_many :comments
  validates :name, presence: true, length: { in: 3..25 }
  validates :instructor, presence: true, length: { in: 3..20}


    def blank_stars
     5 - rating.to_i
    end

end
