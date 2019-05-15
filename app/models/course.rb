class Course < ActiveRecord::Base
  self.per_page = 5
  #has_many :students
  has_many :student_courses
  has_many :students, through: :student_courses
  has_many :ratings
  has_many :comments
  validates :name, presence: true, length: { in: 3..20 }
  validates :instructor, presence: true, length: { in: 3..20}
end
