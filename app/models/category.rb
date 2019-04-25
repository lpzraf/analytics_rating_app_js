class Category < ActiveRecord::Base
  has_many :students, through: :courses

end
