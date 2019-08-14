class UsersController < ApplicationController
  before_action :set_user, only: [:dashboard, :destroy]

  def dashboard
    @user = User.find(params[:id])
    authorize @user
    if @user.parent?
      @wallets = @user.parent_wallets
    else
      @wallet = @user.kid_wallet
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
