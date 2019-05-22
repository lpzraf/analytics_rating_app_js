class ApplicationController < ActionController::Base
  include SessionsHelper
  include ApplicationHelper


  #do i needs what below?
#  helper_method :logged_in?, :current_user, :authorized_to_edit?, :not_allowed_to_edit, :redirect_if_not_logged_in

  #do i needs what below?

#helpers do
#
#     def logged_in?
#       !!current_user
#     end
#
#     def current_user
#       @current_user ||= Student.find(session[:student_id]) if session[:student_id]
#     end
#
#     def authorized_to_edit?(course)
#       course.student == current_user
#     end
#
#     def not_allowed_to_edit(course)
#       if course.student != current_user
#         flash[:errors] = "You can only edit your courses."
#         redirect_to courses_path
#       end
  #   end
  #
   #    def redirect_if_not_logged_in
   #      if !logged_in?
   #        flash[:errors] = "You must be logged in to check this page"
   #        redirect '/login'
   #      end
   #    end
   # end
end
