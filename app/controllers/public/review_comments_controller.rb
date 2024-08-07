class Public::ReviewCommentsController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about], unless: :admin_controller?

  def create
    review = Review.find(params[:review_id])
    comment = current_user.review_comments.new(review_comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to fitness_gym_path(review.fitness_gym_id)
  end

  def destroy
    review_comment = ReviewComment.find(params[:id])
    review = review_comment.review
    review_comment.destroy
    redirect_to fitness_gym_path(review.fitness_gym_id)
  end

  private

  def review_comment_params
    params.require(:review_comment).permit(:comment)
  end
end
