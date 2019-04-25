class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :student_id
      t.integer :course_id
      t.integer :rating

      t.timestamps
    end
  end
end
