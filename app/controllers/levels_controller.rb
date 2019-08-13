class LevelsController < ApplicationController
  before_action :set_level, only: [:show]

  def index
    @levels = Level.all
  end

  def show

  end

  private

  def set_level
    @level = Level.find(params[:id])
  end
end
