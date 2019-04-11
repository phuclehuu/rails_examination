require 'rails_helper'

RSpec.describe Activity, type: :model do

  before(:each) do
  	@activity = create(:activity)
  end

  it 'is valid with valid attributes' do
  	expect(@activity).to be_valid
  end

  it 'has a unique name' do
  	activity2 = build(:activity, name: @activity.name)
  	expect(activity2).to_not be_valid
  end

  it 'is not valid without name' do
  	activity2 = build(:activity, name: nil)
  	expect(activity2).to_not be_valid
  end

end
