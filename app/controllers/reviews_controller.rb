class ReviewsController < ApplicationController
  expose :review
  expose :tutor do
    User.find(params[:tutor_id])
  end

  def new
  end

  def create
    review = Review.new(review_params)
    tutor_id = params[:review][:tutor_id]
    if review.save
      redirect_to reviews_path(tutor_id: tutor_id)
    else
      redirect_to review_path(tutor_id: tutor_id)
    end
  end

  private
  def review_params
    params.require(:review).permit(
      :tutor_id,
      :parent_id,
      :rating,
      :body
    )
  end
end
