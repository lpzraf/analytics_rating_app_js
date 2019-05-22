module ApplicationHelper
  def current_student
      @current_student ||= Student.find_by_id(session[:student_id])
  end


  def full_title(page_title = '')
    base_title = "Analytics Rating App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
