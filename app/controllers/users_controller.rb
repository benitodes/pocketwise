class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :destroy]

  def dashboard
    @user = User.find(params[:id])
    authorize @user
    if @user.parent?
      @wallets = @user.parent_wallets
    else
      @wallet = @user.kid_wallet
      @goals = Goal.where(wallet_id: @wallet)
      @user_course = UserCourse.where(kid: current_user).first
      unless @user_course.nil?
        @course = Course.where(id: @user_course.course_id)
        # find total amount of questions in course for circle
        @levels = Level.where(course_id: @course)
        @total_questions_per_course = 0
        @levels.each do |level|
          level.number_of_questions = Question.where(level_id: level).length
          # save in db
          level.save
          # add up to total
          @total_questions_per_course += level.number_of_questions
        end
        # find total amount of questions answered so far by user
        # find last completed level in course
        # for completed level calculate amount of questions and add them up
        @completed_levels = CompletedLevel.where(user_course_id: @user_course)
        @total_questions_completed = 0
        @completed_levels.each do |completed_level|
          @number_questions_in_level = Question.where(level_id: completed_level.level_id).length
          @total_questions_completed += @number_questions_in_level
        end
        # add last_question number from user course table - 1
        @total_questions_completed += @user_course.last_question - 1

        # check if course is complete. if level nr > number of levels in current course then complete
        if @user_course.last_level > Level.where(course_id: @course).length
          @user_course.complete = true
          @user_course.save
        end
      end
    end


  #   if @user.parent?
  #     @wallets.each do |wallet|
  #       @kid = wallet.kid
  #     end
  #       @enrolled = @kid.user_courses.where(complete: false)
  #       @enrolled.each do |user_course|
  #         @course_id = user_course.course_id
  #         @course = Course.find(@course_id)
  #         @last_level = user_course.last_level
  #         @last_question = user_course.last_question
  #         @last_lecture = user_course.last_lecture
  #       end
  #   end
  end

  def new
    @user = User.new
    authorize current_user
  end

  def create
    @user = User.new(user_params)
    authorize current_user
    @user.parent = false
    if @user.save
      @wallet = Wallet.create!(kid_id: @user.id, parent_id: current_user.id)
      redirect_to edit_wallet_path(@wallet.id)
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to dashboard_user_path(current_user)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :avatar, :gender, :email, :password, :age, :parent)
  end

end
