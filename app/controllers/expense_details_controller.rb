    class ExpenseDetailsController < ApplicationController

        def index
            @expense_details = ExpenseDetail.all
        end

        def new
            @expense_detail = ExpenseDetail.new
            @person = User.all
        end

        def create
            @expense_detail = ExpenseDetail.new(description: params[:description],amount: params[:amount].to_f, paid_by: params[:paid_by].to_i, split_type: params[:split_type])
            if @expense_detail.save
                if params[:split_type] == "unequal"
                   params[:expense][:paid_for].each do |user_id, amount|
                       Expense.create(lender_id: user_id, split_value: amount, split_amount: amount, expense_detail_id: @expense_detail.id)
                       @balance = Balance.find_by(owner_id:  @expense_detail.paid_by, lender_id: user_id)
                       if @balance
                          @balance.update(amount: @balance.amount.to_f + amount.to_f )
                      else
                         Balance.upsert_all([{ owner_id: @expense_detail.paid_by, lender_id: user_id, amount: amount, created_at: Time.current, updated_at: Time.current }], unique_by: [:owner_id, :lender_id])
                     end
                 end
             else
                 arr = params[:paid_for].reject! { |element| element.empty? }
                 split_amount = params[:amount].to_f/arr.length()
                 arr.each do |user_id|
                  # next if user_id == ""
                  Expense.create(lender_id: user_id, split_value: split_amount, split_amount: split_amount, expense_detail_id: @expense_detail.id)
                  @balance = Balance.find_by(owner_id: @expense_detail.paid_by, lender_id: user_id)
                  if @balance
                    @balance.update(amount: @balance.amount.to_f + split_amount.to_f )
                else
                  Balance.upsert_all([{ owner_id: @expense_detail.paid_by, lender_id: user_id, amount: split_amount, created_at: Time.current, updated_at: Time.current }], unique_by: [:owner_id, :lender_id])
              end
          end
      end
      redirect_to root_path, notice: 'Expense was successfully created.'
  else
    @users = User.all
    render :new
end
end

private

def expense_detail_params
    params.permit(:description, :amount, :paid_by, :added_by, :split_type)
end

        # def calculate_split_amount(total_amount, split_type, split_value, expense)
        #     split_amount = 0
        #     if split_type == 'equal'
        #       split_amount = total_amount / expense.size
        #     elsif split_type == 'unequal'
        #       split_amount = split_value
        #     end
        #     split_amount
        # end
    end
