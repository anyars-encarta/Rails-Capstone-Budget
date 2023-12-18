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
    flash.now[:alert] = 'Category not found'
    render :new
  end

  def create
    @expense = Expense.new(expense_params)

    if @expense.save
      @category = Category.find(params[:category_id])
      redirect_to category_expenses_path(@category), notice: 'Expense was successfully added.'
    else
      flash.now[:alert] = "Expense could not be saved: #{result.join(', ')}"
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_id, :author_id)
  end
end
