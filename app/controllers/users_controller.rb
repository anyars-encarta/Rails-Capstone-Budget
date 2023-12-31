class UsersController < ApplicationController
  before_action :set_user, only: %i[show destroy]
  before_action :authenticate_user!

  private

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
