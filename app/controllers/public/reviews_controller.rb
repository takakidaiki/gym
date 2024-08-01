class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about], unless: :admin_controller?

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to fitness_gym_path(@review.fitness_gym_id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      @fitness_gym = FitnessGym.find(params[:review][:fitness_gym_id])
      @reviews = @fitness_gym.reviews
      @review_comment = ReviewComment.new
      @review.user_id = current_user.id
      render "public/fitness_gyms/show"
    end
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @review_comment = ReviewComment.new
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to '/fitness_gyms'
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "You have updated review successfully."
      redirect_to fitness_gym_path(@review.fitness_gym_id)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :star, :fitness_gym_id, :user_id)
  end
end
