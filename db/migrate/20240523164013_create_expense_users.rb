class CreateExpenseUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_users do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
