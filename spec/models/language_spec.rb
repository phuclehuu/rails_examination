require 'rails_helper'

RSpec.describe Language, type: :model do
	
  before(:each) do
  	@language = create(:language)
  end

  it 'is valid with valid attributes' do
  	expect(@language).to be_valid
  end

  it 'has a unique code' do
  	language2 = build(:language, code: @language.code)
  	expect(language2).to_not be_valid
  end

  it 'is not valid without code' do
  	language2 = build(:language, code: nil)
  	expect(language2).to_not be_valid
  end

end
