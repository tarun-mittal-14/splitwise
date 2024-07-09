require 'composite_primary_keys'
class Balance < ApplicationRecord
   self.primary_keys = :owner_id, :lender_id
  belongs_to :owner, class_name: "User"
  belongs_to :lender, class_name: "User"
end
