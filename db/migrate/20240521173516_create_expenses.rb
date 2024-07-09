class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.integer :lender_id
      t.float :split_value
      t.float :split_amount
      t.references :expense_detail, foreign_key: true
      t.integer :expense_id

      t.timestamps
    end
  end
end
