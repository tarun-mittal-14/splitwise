class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :expenses, foreign_key: :lender_id
         has_many :owned_balances, class_name: "Balance", foreign_key: "owner_id", dependent: :destroy
         has_many :lent_balances, class_name: "Balance", foreign_key: "lender_id", dependent: :destroy
end
