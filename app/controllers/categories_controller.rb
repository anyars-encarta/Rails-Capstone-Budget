class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def new
        @categories = Category.new
    end
end
