class Admin::FitnessGymsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @fitness_gym = FitnessGym.new
  end

  def index
    @fitness_gyms = FitnessGym.all
  end
  
  def show
    @fitness_gym = FitnessGym.find(params[:id])
    @reviews = @fitness_gym.reviews
  end

  def edit
    @fitness_gym = FitnessGym.find(params[:id])
  end

  def create
    @fitness_gym = FitnessGym.new(fitness_gym_params)
    if @fitness_gym.save
      redirect_to admin_fitness_gyms_path
    else
      render :new
    end
  end

  def update
    @fitness_gym = FitnessGym.find(params[:id])
    if @fitness_gym.update(fitness_gym_params)
      redirect_to edit_admin_fitness_gym_path(@fitness_gym)
    else
      render :edit
    end
  end

  def destroy
    fitness_gym = FitnessGym.find(params[:id])
    fitness_gym.destroy
    redirect_to admin_fitness_gyms_path
  end
  
  private

  def fitness_gym_params
    params.require(:fitness_gym).permit(:name, :content, :address, tag_ids: [])
  end
end
