class FlashController < ApplicationController
  # before_action :redirect_if_signed_in

  skip_before_action :authenticate_user!, only: [:index]
  
  def index; end

  # def redirect_if_signed_in
  #   redirect_to root_path if user_signed_in?
  # end
end
