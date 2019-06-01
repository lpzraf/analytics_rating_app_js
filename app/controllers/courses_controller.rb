class CoursesController < ApplicationController

  def index
    @courses = Course.paginate(page: params[:page]).ordered
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course
    else
      render 'edit'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to courses_path
  end

  def top_rated_courses

    # @top_rated = Course.joins(:reviews).group("courses.id").order("sum(reviews.rating) desc")
  end

  private
  def course_params
    params.require(:course).permit(
      :name,
      :instructor
    )
  end
end
