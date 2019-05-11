class RatingsController < ApplicationController

def create

end

#everything is new w the exception of empty def create
#   before_action :set_rating, only: [:edit, :update, :destroy]
#   before_action :set_course
#   before_action :authenticate_user!
#   before_action :admin_student, only: [:edit, :update, :destroy]
#
#   def new
#     @rating = Rating.new
#   end
#
#   # GET /ratings/1/edit
#   def edit
#   end
#
#   # POST /ratings
#   # POST /ratings.json
#   def create
#     @rating = Rating.new(rating_params)
#     @rating.student_id = current_student.id
#     @rating.course_id = @course.id
#
#     respond_to do |format|
#       if @rating.save
#         format.html { redirect_to @course, notice: 'Rating was successfully created.' }
#         format.json { render :show, status: :created, location: @rating }
#       else
#         format.html { render :new }
#         format.json { render json: @rating.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # PATCH/PUT /ratings/1
#   # PATCH/PUT /ratings/1.json
#   def update
#     respond_to do |format|
#       if @rating.update(rating_params)
#         format.html { redirect_to course_path(@course), notice: 'Rating was successfully updated.' }
#         format.json { render :show, status: :ok, location: @rating }
#       else
#         format.html { render :edit }
#         format.json { render json: @rating.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # DELETE /ratings/1
#   # DELETE /ratings/1.json
#   def destroy
#     @rating.destroy
#     respond_to do |format|
#       format.html { redirect_to course_path(@course), notice: 'Rating was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end
#
# private
# #new
# def set_rating
#   @rating = Rating.find(params[:id])
# end
#
# def set_course
#  @course = Course.find(params[:id])
# end
#
#
#   def rating_params
#     params.require(:rating).permit(
#       :rating,
#       :student_id,
#       :course_id
# )
#   end
end
