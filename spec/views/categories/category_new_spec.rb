require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create!(name: 'John Doe', email: 'sample@gmail.com', password: 'password')
  end

  describe 'GET /new' do
    it 'returns http success' do
      sign_in @user
      get new_category_path
      follow_redirect!
      expect(response).to have_http_status(:success)
    end

    it 'should render categories/new template' do
      sign_in @user
      get new_category_path
      follow_redirect!
      expect(response).to render_template(:new)
    end
  end
end
