class AddColumnsToWallet < ActiveRecord::Migration[5.2]
  def change
    add_column :wallets, :total_allowance, :integer
    add_column :wallets, :payout_day, :string
  end
end
