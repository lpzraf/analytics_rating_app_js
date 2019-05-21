class ChangeDefaultForRatingRating < ActiveRecord::Migration[5.2]
  def change
    change_column :ratings, :rating, :integer, :default => 0
  end
end
