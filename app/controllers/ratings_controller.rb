class RatingsController < ApplicationController
  def create

  end

private
  def rating_params
    params.require(:rating).permit(
      :rating,
      :student_id,
      :course_id
)
  end
end
