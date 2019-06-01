class Course < ActiveRecord::Base
  self.per_page = 3

  has_many :ratings
  has_many :students, through: :ratings
  validates :name, presence: true, length: { in: 3..35 }
  validates :instructor, presence: true, length: { in: 3..20}

  def self.ordered
  order("name")
  end

 #  def self.top_rated_courses
 #   ratings.rating_desc.first
 # end

  # scope :top_rated_courses, -> { includes(:ratings).group('course_id').order('AVG(ratings.rating) DESC')}

  def self.average_rating
    Courses.joins(:ratings).avaerage(:rating).order('ratings.rating desc')
  end

  # def self.top_rated_courses
  #   @courses =  Rating.limit(5).order(average_rating: :desc).group(:course_id).joins(:course).average(:rating)
  # end
  # def self.top_rated_courses
  #   Course.joins(:reviews).group("courses.id").order("sum(reviews.rating) desc")
  # end

end
