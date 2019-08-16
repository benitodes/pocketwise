class AddDefaultToWallets < ActiveRecord::Migration[5.2]
  def change
    change_column :wallets, :payout_amount, :integer, default: 0
  end
end
