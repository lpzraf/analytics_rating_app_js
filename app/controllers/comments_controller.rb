class CommentsController < ApplicationController
  def create
   @course = Course.find(params[:course_id])
   @comment = @course.comments.create(comment_params)
   redirect_to course_path(@course)
 end

 def destroy
   @course = Course.find(params[:course_id])
   @comment = @course.comments.find(params[:id])
   @comment.destroy
   redirect_to course_path(@course)
 end

 private
   def comment_params
     params.require(:comment).permit(:commenter, :body)
   end
end
