class Public::FitnessGymsController < ApplicationController
  def index
    @fitness_gyms = Fitness_Gym.all
    @fitness_gyms = Fitness_Gym.paginate(page: params[:page], per_page: 5).search(params[:search])
  end

  def show
  end
end
