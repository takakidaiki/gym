class Admin::GymController < ApplicationController
  def new
    @gym = Gym.new
  end

  def index
    @gyms = Gym.all
  end

  def edit
    @gym = Gym.find(params[:id])
  end
  
  def create
    @gym = Gym.new(gym_params)
  end
  
  def update
  end
end
