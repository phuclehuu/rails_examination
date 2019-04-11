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
  
end
