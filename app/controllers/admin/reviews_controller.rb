class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
    def show
      @review = Review.find(params[:id])
      @fitness_gym = @review.fitness_gym
    end

    def destroy
      review = Review.find(params[:id])
      fitness_gym = FitnessGym.find(params[:fitness_gym_id])
      review.destroy
      redirect_to admin_fitness_gym_path(fitness_gym)
    end
end
