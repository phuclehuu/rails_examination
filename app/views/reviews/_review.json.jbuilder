json.extract! review, :id, :score, :comment, :created_at, :updated_at
json.url review_url(review.guide_id, review.id)
