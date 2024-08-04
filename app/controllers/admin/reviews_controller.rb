class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
    def index
      @reviews = Review.
    end
end
