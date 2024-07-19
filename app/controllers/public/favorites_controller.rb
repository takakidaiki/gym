class Public::FavoritesController < ApplicationController
  def create
    fitness_gym = FitnessGym.find(params[:fitness_gym_id])
    favorite = current_user.favorites.new(fitness_gym_id: fitness_gym.id)
    favorite.save
    redirect_to fitness_gym_path(fitness_gym)
  end

  def destroy
    fitness_gym = FitnessGym.find(params[:fitness_gym_id])
    favorite = current_user.favorites.find_by(fitness_gym_id: fitness_gym.id)
    favorite.destroy
    redirect_to fitness_gym_path(fitness_gym)
  end

end
