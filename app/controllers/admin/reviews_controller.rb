class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
    def show
      @review = Review.find(params[:id])
      @fitness_gym = @review.fitness_gym
    end
    
    def edit
      @review = Review.find(params[:id])
    end
    
    def update
      @review = Review.find(params[:id])
      @fitness_gym = FitnessGym.find(params[:fitness_gym_id])
      if @review.update(review_params)
        flash[:notice] = "You have updated review successfully."
        redirect_to admin_fitness_gym_path(@fitness_gym)
      else
        render :edit
      end
    end

    def destroy
      review = Review.find(params[:id])#reviewでfitness_gym_idというカラムを持っているので下記のような書き方ができる
      fitness_gym = FitnessGym.find(params[:fitness_gym_id])
      review.destroy
      redirect_to admin_fitness_gym_path(fitness_gym)
    end
    
    private
    
    def review_params
      params.require(:review).permit(:title, :content, :star, :fitness_gym_id)
    end
    
end
