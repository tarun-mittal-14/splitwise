class CreateBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :balances, id: false do |t|
      t.integer :owner_id
      t.integer :lender_id
      t.float :amount

      t.timestamps
    end
    execute "ALTER TABLE balances ADD PRIMARY KEY (owner_id, lender_id);"
  end
end
