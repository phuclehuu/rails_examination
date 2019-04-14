class ReviewsController < ApplicationController
  before_action :force_json, only: [:create]

  # GET /reviews
  # GET /reviews.json
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

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.guide = Guide.find(params[:guide_id])

    unless @review.save
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    Review.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to guide_reviews_path, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:score, :comment)
    end

    def force_json
      request.format = :json
    end
end
