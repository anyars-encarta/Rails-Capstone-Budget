class ExpensesController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @category = Category.find(params[:id])
        @expenses = @category.expenses.order(created_at: :desc)
    end

    def new
      @category = Category.find(params[:category_id])
      @expense = Expense.new

      rescue ActiveRecord::RecordNotFound
  
      redirect_to categories_path, alert: 'Category not found'
    end

    def create
      name = params[:expense][:name]
      amount = params[:expense][:amount].to_i
      category_id = params[:expense][:category_id].to_i
      user_id = current_user.id
  
      success, result = Expense.new.save_expense(name, amount, category_id, user_id)
  
      if success
        @category = Category.find(category_id)
        redirect_to category_expenses_path(@category), notice: 'Expense was successfully added.'
      else
        flash.now[:alert] = "Expense could not be saved: #{result.join(', ')}"
        render :new
      end
    end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id, :user_id)
  end
end
