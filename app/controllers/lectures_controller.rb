class LecturesController < ApplicationController
  def show
    @level = Level.find(params[:level_id])
    @lecture = Lecture.find(params[:id])
    @next_lecture = Lecture.where(level: @level).find_by(number: @lecture.number + 1)
    # find user to get back to user dashboard
    @user = current_user
  end
end
