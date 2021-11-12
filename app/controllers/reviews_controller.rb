class ReviewsController < ApplicationController

  before_action :set_reviews

  def new
    @review = Review.new
  end

  def create
    @list = set_reviews
    @review = Review.new(review_params)
    @review.list = @list

    if @review.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating )
  end

  def set_reviews
    @list = List.find(params[:list_id])
  end
end
