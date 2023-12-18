require 'rails_helper'

RSpec.describe 'Expenses', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create!(name: 'John Doe', email: 'sample@gmail.com', password: 'password', confirmed_at: Time.zone.now)
    @category = Category.create!(name: 'Journey', icon: Category::ICONS.keys.first, user_id: @user.id)
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in @user
      get expenses_new_path(category_id: @category.id)
      expect(response).to have_http_status(:success)
    end

    it 'should render categories/new template' do
      sign_in @user
      get expenses_new_path(category_id: @category.id)
      
      expect(response).to render_template(:new)
    end
  end
end
