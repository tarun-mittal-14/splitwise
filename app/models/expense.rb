class Expense < ApplicationRecord

  belongs_to :lender, class_name: "User", foreign_key: :lender_id
  belongs_to :expense_detail

  # attr_accessor :lender_id, :split_value, :split_amount, :expense_detail_id

  # def initialize(lender_id, split_value, split_amount, expense_detail_id)
  #   @lender_id = lender_id
  #   @split_value = split_value
  #   @split_amount = split_amount
  #   @expense_detail_id = expense_detail_id
  # end

end
