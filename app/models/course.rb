class Course < ActiveRecord::Base
  has_many :students
  validates :name, presence: true, length: { in: 3..20 }
  validates :instructor, presence: true, length: { in: 3..20}
end
