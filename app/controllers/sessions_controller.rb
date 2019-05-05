class SessionsController < ApplicationController
  # def login
  # end
  #
  # def signup
  # end
  #
  # def welcome
  # end

  def new
    #@session = Session.new
  end

  def create
    student = Student.find_by(email: params[:session][:email].downcase)
      if student && student.authenticate(params[:session][:password])
        log_in student
        redirect_to student
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
