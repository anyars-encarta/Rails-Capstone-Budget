class FlashController < ApplicationController
  # before_action :redirect_if_signed_in

    def index
      @user = current_user
    end

    # def redirect_if_signed_in
    #   redirect_to root_path if user_signed_in?
    # end
  end
  