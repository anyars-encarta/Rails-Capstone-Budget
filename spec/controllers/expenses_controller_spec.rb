require 'rails_helper'

RSpec.describe 'EntityCategories', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'John Doe', email: 'sample@test.com', password: 'password') }
  let(:category) { Category.create!(name: 'Journey', icon: Category::ICONS.keys.first, user:) }

  let(:valid_params) { { name: 'someone', amount: 5, category_id: category.id } }
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

    it 'should assign @category and @entity_category' do
      get new_category_expense_path(category)
      expect(assigns(:category)).to eq(category)
      expect(assigns(:category).category).to eq(category)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'should create a new Expense' do
        expect do
          post category_expenses_path(category), params: { expenses: valid_params }
        end.to change(Category, :count).by(1)
      end

      it 'should associate the Expense with the Category' do
        post category_expenses_path(category), params: { expense: valid_params }
        expect(category.expenses).to include(assigns(:expense))
      end

      it 'should redirect to category/show page' do
        post category_expense_path(category), params: { expense: valid_params }
        expect(response).to redirect_to(category_expenses_path(category))
      end
    end
  end
end