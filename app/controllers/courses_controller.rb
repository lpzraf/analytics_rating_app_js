class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)

    @course.save
    redirect_to @course
  end

  def update
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(
      :name,
      :instructor,
      #:cat_name????
    )
end
end
