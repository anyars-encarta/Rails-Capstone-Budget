require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) do
    User.create!(name: 'John Doe', email: 'sample@test.com', password: 'password', confirmed_at: Time.zone.now)
  end
  let(:category) { Category.create!(name: 'Journey', icon: Category::ICONS.keys.first, user:) }

  let(:valid_params) { { name: 'someone', amount: 5, category_id: category.id, author_id: user.id } }
  let(:invalid_params) { { name: nil, amount: 5 } }

  before do
    sign_in user
  end

  describe 'GET /new' do
    it 'should return a 200 OK status' do
      get new_category_expense_path(category)

      expect(response).to have_http_status(:ok)
    end

    it 'should render items/new template' do
      get new_category_expense_path(category)

      expect(response).to render_template(:new)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'should create a new Expense' do
        expect do
          post category_expenses_path(category), params: { expense: valid_params }
        end.to change(Expense, :count).by(1)
      end
    end
  end
end
