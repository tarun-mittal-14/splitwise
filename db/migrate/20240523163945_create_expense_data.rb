class CreateExpenseData < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_data do |t|
      t.string :description
      t.integer :paid_by
      t.string :split_type

      t.timestamps
    end
  end
end
