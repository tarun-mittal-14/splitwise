class RemoveExpenseIdFromExpenses < ActiveRecord::Migration[6.1]
  def change
    remove_column :expenses, :expense_id, :integer
  end
end
