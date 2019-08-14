class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :destroy]
  mount_uploader :avatar, PhotoUploader

  def dashboard
    @user = User.find(params[:id])
    if @user.parent?
      @wallets = @user.parent_wallets
    else
      @wallets = @user.kid_wallet
    end
  end

  def new
    @user = User.new(parent: false)
  end

  def create
    @user = User.new(user_params)
    @user.parent = false
    if @user.save
      Wallet.create!(kid_id: @user.id, parent_id: current_user.id)
      redirect_to dashboard_user_path(current_user)
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
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
