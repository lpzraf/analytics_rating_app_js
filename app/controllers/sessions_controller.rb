class SessionsController < ApplicationController
  def new
  end

  def create
      if auth
        @student = Student.find_or_create_by(uid: auth['uid']) do |u|
          u.first_name = auth['info']['first_name']
          u.email = auth['info']['email']
          u.password = auth['uid'] #use secure random hex
        end

        session[:student_id] = @student.id
        flash[:success] = "Welcome!"
        redirect_to '/courses'
      else
          student = Student.find_by(email: params[:session][:email].downcase)
            if student && student.authenticate(params[:session][:password])
              log_in student
              params[:session][:remember_me] == '1' ? remember(student) : forget(student)
              #redirect_back_or student
              redirect_to student
            else
              flash.now[:danger] = 'Invalid email/password combination'
              render 'new'
          end
      end
  end


  def destroy
    log_out if logged_in?
    flash[:success] = "Good bye! You have succesfully logged out."
    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
