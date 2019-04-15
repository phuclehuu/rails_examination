class ReviewsController < ApplicationController
  before_action :force_json, only: [:create]

  def index
    if request.content_type == 'application/json'
      @reviews = Review.all.where('guide_id =?', params[:guide_id])
    else
      @guide = Guide.find(params[:guide_id]) rescue nil
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @review = Review.new(review_params)
    @review.guide = Guide.find(params[:guide_id])

    unless @review.save
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Review.destroy(params[:id])
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    def review_params
      params.require(:review).permit(:score, :comment)
    end

    def force_json
      request.format = :json
    end
end
