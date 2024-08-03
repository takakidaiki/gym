class Public::FitnessGymsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about], unless: :admin_controller?

  def index
     @search_word = params[:search]

    respond_to do |format|

      format.html do
        @fitness_gyms = FitnessGym.includes(:gym_tags)
        @fitness_gyms = @fitness_gyms.where('name LIKE ?', "%#{@search_word}%") if @search_word.present?
        if params[:tag_ids].present? && params[:tag_ids].reject(&:blank?).any?
          @fitness_gyms = @fitness_gyms.where('gym_tags.tag_id': params[:tag_ids])
        end
        @reviews = Review.all
      end
      format.json do
        # こちらが地図で扱う内容
        @fitness_gyms = FitnessGym.includes(:gym_tags)
        @fitness_gyms = @fitness_gyms.where('name LIKE ?', "%#{@search_word}%") if @search_word.present?
        if params[:tag_ids].present? && params[:tag_ids].reject(&:blank?).any?
          @fitness_gyms = @fitness_gyms.where('gym_tags.tag_id': params[:tag_ids])
        end
      end
    end
  end

  def show
    @fitness_gym = FitnessGym.find(params[:id])
    @reviews = @fitness_gym.reviews
    @review = Review.new
    @review_comment = ReviewComment.new
    @review.user_id = current_user.id
  end

  def new
    @fitness_gym = FitnessGym.new
    @tags = Tag.all
  end

  def create
    @fitness_gym = FitnessGym.new(fitness_gym_params)
    @fitness_gym.save
    redirect_to fitness_gym_path
  end

  def fitness_gym_params
      params.require(:fitness_gym).permit(:address, :genre_id, tag_ids: [])
  end
end
