class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  # before_action :skip_pundit

  def home
  end
end
