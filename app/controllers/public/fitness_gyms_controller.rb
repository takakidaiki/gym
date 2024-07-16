class Public::FitnessGymsController < ApplicationController
  def index
    @fitness_gyms = FitnessGym.includes(:gym_tags)
    @fitness_gyms = @fitness_gyms.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    if params[:tag_ids].present? && params[:tag_ids].reject(&:blank?).any?
      @fitness_gyms = @fitness_gyms.where('gym_tags.tag_id': params[:tag_ids]) 
    end
    @reviews = Review.all
    @users = current_user.id
  end

  def show
    @fitness_gym = FitnessGym.find(params[:id])
    @reviews = @fitness_gym.reviews
    @review = Review.new
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
