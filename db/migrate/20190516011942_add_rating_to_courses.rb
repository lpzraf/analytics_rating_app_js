class AddRatingToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :rating, :integer, :default => 0
  end
end
