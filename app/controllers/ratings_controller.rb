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

  end

  def create
  end

  #look at nested resources lesson.....rating will not save if it doesnt have both course and student id (one comes from curent user method adn the other from the id in the url)
end
