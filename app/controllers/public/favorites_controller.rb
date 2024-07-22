class Public::FavoritesController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    favorite = current_user.favorites.new(review_id: review.id)
    favorite.save!
    redirect_to fitness_gym_path(review.fitness_gym_id)
  end

  def destroy
    review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: review.id)
    favorite.destroy!
    redirect_to fitness_gym_path(review.fitness_gym_id)
  end

end
