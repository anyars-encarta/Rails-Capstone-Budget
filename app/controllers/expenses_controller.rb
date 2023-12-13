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
      # Handle the case where the category is not found, such as redirecting to a different page or showing an error message
      redirect_to categories_path, alert: 'Category not found'
    end

    def create
      @category = Category.find(expense_params[:category_id])
      @expense = @category.expenses.new(expense_params)
        if @expense.save
          redirect_to category_expenses_path(@category), notice: 'Expense was successfully added.'
        else
          render :new
        end
    end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id)
  end
end
