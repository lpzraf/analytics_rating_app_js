class Course < ActiveRecord::Base
  has_many :students
  has_many :ratings
  has_many :comments
  validates :name, presence: true, length: { in: 3..20 }
  validates :instructor, presence: true, length: { in: 3..20}
end
