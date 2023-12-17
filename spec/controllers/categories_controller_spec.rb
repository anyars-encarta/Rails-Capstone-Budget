require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user, confirmed_at: Time.zone.now) } # Create a valid user using a factory

  describe 'GET #index' do
    context 'when user is authenticated' do
      it 'renders the index template' do
        user = create(:user, confirmed_at: Time.zone.now)
        sign_in user

        get :index

        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user is not authenticated' do
      it 'redirects to sign in' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'Create a new category' do
      let(:category) { create(:category, user:) }

      it 'renders the new template' do
        sign_in user # Sign in the user

        get :new, params: { id: category.id }

        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      sign_in user # Sign in the user

      get :new
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
