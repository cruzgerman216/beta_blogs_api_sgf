require 'rails_helper'

RSpec.describe Blog, type: :model do
  context "validation tests" do 
    it 'is not valid without a title' do 
      user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", username: "johndoe123")
      blog = Blog.new(content: "Sample Content", user: user)

      expect(blog).not_to be_valid
    end

    it 'is not valid without a content' do 
      user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", username: "johndoe123")
      blog = Blog.new(title: "Sample title", user: user)

      expect(blog).not_to be_valid
    end
  end
end
