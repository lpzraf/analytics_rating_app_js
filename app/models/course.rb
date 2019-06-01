class Course < ActiveRecord::Base
  self.per_page = 3

  has_many :ratings
  has_many :students, through: :ratings
  validates :name, presence: true, length: { in: 3..35 }
  validates :instructor, presence: true, length: { in: 3..20}

  def self.ordered
  order("name")
  end

  # scope :top_rated_courses, -> { includes(:ratings).group('course_id').order('AVG(ratings.rating) DESC')}


  # def self.top_rated_courses
  #   Course.joins(:reviews).group("courses.id").order("sum(reviews.rating) desc")
  # end

end
