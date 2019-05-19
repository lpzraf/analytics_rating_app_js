class Category < ActiveRecord::Base
  #has_many :students, through: :courses

  has_many :courses
  has_many :students, :through => :courses

  accepts_nested_attributes_for :courses

end
