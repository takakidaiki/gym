class Public::FitnessGymsController < ApplicationController
  def index
    #@fitness_gyms = FitnessGym.all
    @fitness_gyms = params[:tag_id].present? ? Tag.find(params[:tag_id]).fitness_gyms : FitnessGym.all
  end

  def show
    @fitness_gym = FitnessGym.find(params[:id])
  end

  def new
    @fitness_gym = FitnessGym.new
    @tags = Tag.all
  end

  def create
    @fitness_gym = FitnessGym.new(fitness_gym_params)
    @fitness_gym.save
    redirect_to fitness_gyms_path
  end

  def fitness_gym_params
      params.require(:fitness_gym).permit(tag_ids: [])
  end
end
