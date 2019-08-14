class WalletsController < ApplicationController
  def edit
    @wallet = Wallet.find(params[:id])
    authorize @wallet
  end

  def update
    @wallet = Wallet.find(params[:id])
    @wallet.update(wallet_params)
    redirect_to dashboard_user_path(current_user)
  end

  def show
  end

  def wallet_params
    params.require(:wallet).permit(:total_allowance, :payout_frequency, :payout_day)
  end
end
