class LecturesController < ApplicationController
  def show
    @level = Level.find(params[:level_id])
    @lecture = Lecture.find(params[:id])
    @next_lecture = Lecture.where(level: @level).find_by(number: @lecture.number + 1)
    @user = current_user
  end
end
