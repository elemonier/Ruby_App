class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  skip_before_filter :require_admin, :only => [:show, :index]
 # skip_before_filter :correct_user, :only => [:show, :index]
  def index
    if @current_user.role == 'student'
       @courses = @current_user.courses
    else
      @courses = Course.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new
    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render json: @course, status: :created, location: @course }
      else
        format.html { render action: "new" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])
    if(params.has_key?(:user_id_to_add))
      @user = User.find(params[:user_id_to_add])
      @course.users << @user
      params[:user_id_to_add].delete
    end
    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end
  # GET /courses/addUsers

  def addUsersForm
  end

  def addUsers
    @course = Course.where(id: params[:course_id]).first
    users = params[:users]
    users.each do |userid|
        user = User.where(id: userid).first
        unless @course.user_ids.include?(user.id)
          @course.user_ids << user.id
          @course.save
        end
    end
    redirect_to course_path(@course)
  end
end