require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { User.create!(name: 'John Doe', email: 'sample@gmail.com', password: 'password') }
  let(:category) { Expense.create!(name: 'Journey', amount: 200, category:, user:) }

  before do
    login_as(user, scope: :user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get expenses_path

      follow_redirect!

      expect(response).to have_http_status(:success)
    end
  end
end