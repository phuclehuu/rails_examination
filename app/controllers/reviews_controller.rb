class ReviewsController < ApplicationController
  before_action :force_json, only: [:create]

  def index
    if request.content_type == 'application/json'
      @reviews = Review.all.where('guide_id =?', params[:guide_id]).order(sort_column + " " + sort_direction)
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

    def sort_column
      Review.column_names.include?(params[:sort]) ? params[:sort] : "score"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
