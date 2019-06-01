class RatingsController < ApplicationController

  def index
    @course = Course.find_by_id(params[:course_id])
    if @course
      @ratings = @course.ratings
    else
      redirect_to courses_path
    end
  end

  def new
    @course = Course.find_by_id(params[:course_id])
    #@rating = Rating.new(course: @course)   this line is the same as the one below
    @rating = @course.ratings.build
  end

  def create
    #@course = Course.find_by_id(params[:course_id])
    @rating = current_student.ratings.build(rating_params)
    #@rating.course = @course
    if @rating.save
      redirect_to course_path(@rating.course)
    else
      render :new
    end
  end

  def top_rated_classes
  end
  private

  def rating_params
    params.require(:rating).permit(:rating, :course_id )
  end
end
