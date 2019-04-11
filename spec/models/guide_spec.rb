require 'rails_helper'

RSpec.describe Guide, type: :model do
  
  before(:each) do
  	@guide = create(:guide)
  end

  it 'is valid with valid attributes' do
  	expect(@guide).to be_valid
  end

  it 'has a unique email' do
  	guide2 = build(:guide, email: @guide.email)
  	expect(guide2).to_not be_valid
  end

  it 'is not valid without an email' do
  	guide2 = build(:guide, email: nil)
  	expect(guide2).to_not be_valid
  end
  
  describe do
  	it 'has and belongs to many activities' do
  	  association = described_class.reflect_on_association(:activities)
      expect(association.macro).to eq :has_and_belongs_to_many
  	end
  end
  
  describe do
  	it 'has and belongs to many languages' do
  	  association = described_class.reflect_on_association(:languages)
      expect(association.macro).to eq :has_and_belongs_to_many
  	end
  end

  describe do
  	it 'has many reviews' do
  	  association = described_class.reflect_on_association(:reviews)
  	  expect(association.macro).to eq :has_many
  	end
  end

end
