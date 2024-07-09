class Expense < ApplicationRecord

  belongs_to :lender, class_name: "User", foreign_key: :lender_id
  belongs_to :expense_detail

end
