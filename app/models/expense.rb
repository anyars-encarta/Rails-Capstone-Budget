class Expense < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true
  validates :category_id, presence: true

  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  belongs_to :category

  def save_expense(name, amount, category_id, user_id)
    expense = Expense.new(
      name:,
      amount:,
      category_id:,
      author_id: user_id
    )

    return true, expense if expense.save


    [false, expense.errors.full_messages]
  end
end
