require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a username' do
    user = build(:user, username: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without an email' do 
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a first_name' do
    user = build(:user, first_name: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a last name' do
    user = build(:user, last_name: nil)
    expect(user).to_not be_valid
  end
end
