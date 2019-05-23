class Course < ActiveRecord::Base
  self.per_page = 3

  has_many :ratings
  has_many :students, through: :ratings
  has_many :comments
  validates :name, presence: true, length: { in: 3..35 }
  validates :instructor, presence: true, length: { in: 3..20}

  def self.ordered
  order("name")
  end

end
