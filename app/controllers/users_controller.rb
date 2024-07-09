class UsersController < ApplicationController
  before_action :authenticate_user!

    def index
      @current_user = current_user
        @person = User.all
        @users = User.all
    end

    def show
        @people = User.all
        @person = User.find(params[:id])
        # @person = current_user
        # @expense_details = ExpenseDetail.where(paid_by: @person.id).includes(:expenses)
        @expense_details = ExpenseDetail.where(paid_by: @person.id)
        @expense_list = Expense.where(expense_detail_id: @expense_details.pluck(:id))
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @person }
            format.js { render partial: 'user_details', locals: { user: @person } }
          end
    end
  end
