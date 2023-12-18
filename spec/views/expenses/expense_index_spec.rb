require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'John Doe', email: 'sample@gmail.com', password: 'password', confirmed_at: Time.zone.now) }
  let(:category) { Category.create!(name: 'Journey', icon: Category::ICONS.keys.first, user:) }

  let(:expense_params) { { name: 'Journey', amount: 200, category_id: category.id, user_id: user.id } }
  let(:expense) { Expense.create!(expense_params) }

  before do
    login_as(user, scope: :user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get category_expenses_path(category)

      expect(response).to have_http_status(:success)
    end
  end
end
