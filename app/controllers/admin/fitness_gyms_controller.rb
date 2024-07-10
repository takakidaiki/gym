class Admin::FitnessGymsController < ApplicationController
  def new
    @fitness_gym = FitnessGym.new
  end

  def index
    @fitness_gyms = FitnessGym.all
  end

  def edit
    @fitness_gym = FitnessGym.find(params[:id])
  end
  
  def create
    @fitness_gym = FitnessGym.new(fitness_gym_params)
    if @fitness_gym.save!
      redirect_to admin_fitness_gyms_path
    else
      render :new
    end
  end
  
  def update
    @fitness_gym = FitnessGym.find(params[:id])
    if @fitness_gym.update(fitness_gym.params)
      redirect_to admin_fitness_gym_path(@fitness_gym.id)
    else
      render :edit
    end
  end
  
  def destroy
    fitness_gym = FitnessGym.find(params[:id])
    fitness_gym.destroy
    redirect_to '/admin/fitness_gyms'
  end
  
  def fitness_gym_params
    params.require(:fitness_gym).permit(:content, tag_ids: [])
  end
end
