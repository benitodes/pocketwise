class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :destroy]
  before_action :set_wallet, only: [:index, :new, :create]

  def index
    @wallet = Wallet.find(params[:wallet_id])
    if @wallet.parent == current_user || @wallet.kid == current_user
      @goals = @wallet.goals
    else
      redirect_to root_path
    end
  end

  def new
    @goal = Goal.new(wallet: @wallet)
    authorize @goal
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.wallet = @wallet
    authorize @goal
    if @goal.save
      redirect_to dashboard_user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    authorize @goal
  end

  def update
    authorize @goal
    @goal.update(goal_params)
    redirect_to dashboard_user_path(current_user)
  end

  def destroy
    authorize @goal
    @goal.destroy
    redirect_to dashboard_user_path(current_user)
  end

  private

  def set_wallet
    @wallet = Wallet.find(params[:wallet_id])
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :goal_allowance, :goal_price, :picture)
  end
end
