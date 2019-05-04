class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
  end

  def create
  end

  def show
  end

  private

  def student_params
  end
end
