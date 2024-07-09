class RemoveAddedByFromExpenseDetails < ActiveRecord::Migration[6.1]
  def change
    remove_column :expense_details, :added_by, :integer
  end
end
