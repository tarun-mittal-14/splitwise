class StaticController < ApplicationController
  before_action :authenticate_user!

  def dashboard
  @person = User.all
  @users = User.all
  @current_user = current_user
   @you_owe_balance_list = Balance.where(owner_id: @current_user.id)
   @you_owed_balance_list = Balance.where(lender_id: @current_user.id)
  # @current_user  = User.find(2)
  # @you_owe_balance_list = Balance.where(owner_id: current_user.id)
  # @you_owed_balance_list = Balance.where(lender_id: current_user.id)
  @you_owe = 0
  @you_are_owed = 0
   @you_owe_balance_list.each do |balance|
    @you_owe+= balance.amount
   end
   @you_owed_balance_list.each do |balance|
    @you_are_owed+= balance.amount
   end
  @balance = @you_owe - @you_are_owed

end
  def person
    @person = User.all
    @users = User.all
    @expense_list = Expense.all
    @expense_details = ExpenseDetail.all

  end
  def index
    friend_id = params[:friend_id]
    if friend_id
      @expense_list = Expense.all
    else
      @expense_list = Expense.all
    end
  end

  def show

  end

  private

end
