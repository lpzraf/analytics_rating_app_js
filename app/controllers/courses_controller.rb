class CoursesController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @courses = Course.paginate(page: params[:page])
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

  private
    #new
     #  def set_course
     #   @course = Course.find(params[:id])
     # end

  def course_params
    params.require(:course).permit(
      :name,
      :instructor,
      :rating,
      category_attributes:[:cat_name]
    )
  end
end
