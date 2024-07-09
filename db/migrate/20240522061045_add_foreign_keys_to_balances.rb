class AddForeignKeysToBalances < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :balances, :users, column: :owner_id
    add_foreign_key :balances, :users, column: :lender_id
  end
end
