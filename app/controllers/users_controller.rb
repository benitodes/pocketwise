class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :destroy]

  def dashboard
    @user = User.find(params[:id])
    authorize @user
    @done_percentage = 0
    @goal_percentage = 0
    if @user.parent?
      @wallets = @user.parent_wallets
      @done_percentage = Hash.new
      @goal_percentage = Hash.new
      unless @wallets.first.nil?
        @wallets.each do |wallet|
          # @done_percentage[wallet] = learning_progress_percentage(wallet.kid_id)
          # @goal_percentage[wallet] = goal_progress_percentage(wallet.kid_id)

        end
      end
    else
      @wallet = @user.kid_wallet
      @goals = Goal.where(wallet_id: @wallet)
      @user_course = UserCourse.where(kid: current_user).first
      unless @user_course.nil?
        @course = Course.where(id: @user_course.course_id)
        learning_progress_percentage(current_user)
        my_goal_progress_percentage(current_user)
        # check if course is complete. if level nr > number of levels in current course then complete
        if @user_course.last_level > Level.where(course_id: @course).length
          @user_course.complete = true
          @user_course.save
        end
      end
    end
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

  def edit
    @user = current_user
    authorize current_user
  end

  def update
    @user = current_user
    authorize current_user
    if @user.update(user_params)
      redirect_to dashboard_user_path(@user)
    else
      render "devise/registrations/edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to dashboard_user_path(current_user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # user params have been updated to use a custom update method into the user controller. Without overriding, the form was aking for a new password. We fix that but now we don't need the current password to update. Fix that!
    user_params = params.require(:user).permit(:first_name, :last_name, :username, :avatar, :gender, :email, :password, :password_confirmation, :age, :parent)
    user_params.delete(:password) unless user_params[:password].present?
    user_params.delete(:password_confirmation) unless user_params[:password_confirmation].present?
    user_params
  end

  def learning_progress_percentage(kid_id)
    @user_course = UserCourse.where(kid: kid_id).first
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
        # calculate percentage done
        @done_percentage = @total_questions_completed.to_f / @total_questions_per_course.to_f * 100
      end
  end

  # method for parents
  def goal_progress_percentage(kid_id)
    # find wallet with kid id
    @wallet = Wallet.where(kid_id: kid_id).first
    @goal = Goal.where(wallet_id: @wallet).first
    if @goal
      # if @goal.goal_current_saving != 0
       @goal_percentage = @goal.goal_current_saving.to_f / @goal.goal_price.to_f * 100
      # end
    end
  end

  # method for kids
  def my_goal_progress_percentage(kid_id)
    @wallet = Wallet.where(kid_id: kid_id).first
    @goals = Goal.where(wallet_id: @wallet)
    @goal_percentage = Hash.new
    if @goals
      @goals.each do |goal|
       @goal_percentage[goal] = goal.goal_current_saving.to_f / goal.goal_price.to_f * 100
      end
      # en
    end
  end
end
