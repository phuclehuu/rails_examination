require 'rails_helper'

RSpec.describe Review, type: :model do

  describe do
  	it "belongs to guide" do
  	  association = described_class.reflect_on_association(:guide)
      expect(association.macro).to eq :belongs_to
  	end
  end

  it 'is valid with valid attributes' do
  	review = create(:review)
  	expect(review).to be_valid
  end

  it 'is not valid without score' do
	  review = create(:review)
  	review.score = nil
  	expect(review).to_not be_valid
  end

  it 'is not valid with score greater than 5' do
	  review = create(:review)
  	review.score = 6
  	expect(review).to_not be_valid
  end

  it 'is not valid with score less than 1' do
	  review = create(:review)
  	review.score = 0
  	expect(review).to_not be_valid
  end

end
