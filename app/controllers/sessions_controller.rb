class SessionsController < ApplicationController
  def new
    #@session = Session.new
  end

  # def create
  #   student = Student.find_by(email: params[:session][:email].downcase)
  #     if student && student.authenticate(params[:session][:password])
  #       log_in student
  #       params[:session][:remember_me] == '1' ? remember(student) : forget(student)
  #       #redirect_back_or student
  #       redirect_to student
  #     else
  #       flash.now[:danger] = 'Invalid email/password combination'
  #       render 'new'
  #     end
  # end
###

def create
    if auth
        @student = Student.find_by(uid: auth["uid"])
        if @student
            session[:student_id] = @student.id
            redirect_to student_path(@student)
        else
            @student = Student.new_student_from_auth(auth)
            if @student.save
                session[:student_id] = @student.id
                redirect_to student_path(@student)
            else
                raise @student.errors.full_messages.inspect
            end
        end
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






###
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
