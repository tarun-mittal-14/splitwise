class CreateExpenseDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_details do |t|
      t.string :description
      t.float :amount
      t.integer :paid_by
      t.integer :added_by
      t.string :split_type
      t.float :total_amount

      t.timestamps null: false
      t.float :tax, default: 0.0
      t.float :tip, default: 0.0
    end
  end
end
