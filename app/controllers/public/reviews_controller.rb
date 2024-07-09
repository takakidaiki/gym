class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to reviews_path
    else
      flash.now[:alert] = "投稿に失敗しました。" 
      render :new
    end
  end

  def index
    @reviews = Review.page(params[:page])
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
    redirect_to '/reviews'
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "You have updated review successfully."
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :content, :star)
  end
end
