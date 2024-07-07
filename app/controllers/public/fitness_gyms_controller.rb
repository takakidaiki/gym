class Public::FitnessGymsController < ApplicationController
  def index
    #@fitness_gyms = FitnessGym.all
    @fitness_gyms = FitnessGym.page(params[:page]).per(5).search(params[:search])
  end

  def show
  end
  
  def new
    @fitness_gym = FitnessGym.
  end
end
