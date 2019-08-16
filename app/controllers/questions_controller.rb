class QuestionsController < ApplicationController
  def show
    @level = Level.find(params[:level_id])
    @question = Question.find(params[:id])
    @user_course = UserCourse.where(kid: current_user, course: @level.course).first
    authorize @question
    @next_question = Question.where(level: @level).find_by(number: @question.number + 1)
    @answers = Answer.where(question_id: @question)
    @user = current_user
    #update your current question
    @user_course.last_question = @question.number
  end

  def increase_level
    # find actual level
    level = Level.find(params[:level_id])
    # find current user_course in which kid is enrolled
    user_course = UserCourse.where(kid: current_user, course: level.course).first
    # Verify how to avoid authorize question becuase no question needed in this method
    @question = Question.first
    authorize @question
    # only increase level by one if last_level is inferior to the current level
    next_level_number = level.number + 1
    if user_course.last_level < next_level_number
      user_course.last_level += 1
      user_course.last_question = 1
      user_course.last_lecture = 1
      user_course.save
      CompletedLevel.create(user_course_id: user_course.id, level_id: level.id)
    end
    # in any case redirect to dashboard
    redirect_to dashboard_user_path(current_user)
  end
end
