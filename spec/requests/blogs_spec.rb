require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  describe "GET /blogs" do

    let(:blog) { create(:blog) }

    before do 
      blog
      get '/blogs'
    end

    it "returns a valid http status" do 
      expect(response).to have_http_status(:ok)
    end

    it "returns a list of blogs" do 
      expect(response.body).to eq(Blog.all.to_json)
    end
  end

  describe "GET /blogs/:id" do

  end

  describe "Post /blogs" do

  end

  describe "PUT /blogs/:id" do

  end

  describe "DELETE /blogs/:id" do

  end
end
