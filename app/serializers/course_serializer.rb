class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :instructor


    has_many :ratings
    has_many :students, through: :ratings
end
