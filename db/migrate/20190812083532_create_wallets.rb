class CreateWallets < ActiveRecord::Migration[5.2]
  def change
    create_table :wallets do |t|
      t.integer :payout_amount
      t.string :payout_frequency
      t.references :kid, index: true, foreign_key: { to_table: :users }
      t.references :parent, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
