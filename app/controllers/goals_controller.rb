class GoalsController < ApplicationController
  before_action :set_goal, only: [:edit, :update, :destroy]
  before_action :set_wallet, only: [:index, :new, :create]

  def index
    @goals = @wallet.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.wallet = @wallet
    @goal.save
    redirect_to wallet_goals_path(@wallet)
  end

  def edit
  end

  def update
    @goal.update(goal_params)
    redirect_to wallet_goals_path(@goal.wallet)
  end

  def destroy
    @goal.destroy
    redirect_to wallet_goals_path(@goal.wallet)
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
