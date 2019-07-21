class CoursesController < ApplicationController

  def index
    @courses = Course.paginate(page: params[:page]).ordered
    respond_to do |f|
      f.html
      f.json {render json: @courses}
    end
  end

  def show
    @course = Course.find(params[:id])
    respond_to do |f|
      f.html
      f.json {render json: @course}
    end
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
      #redirect_to @course
      render json: @course
    else
      render 'new'
    end
  end

  def next
    @next_course = @course.next
    render json: @next_course
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
    @courses =  Rating.limit(5).order(average_rating: :desc).group(:course_id).joins(:course).average(:rating)
  end

  private
  def course_params
    params.require(:course).permit(
      :name,
      :instructor
    )
  end
end
