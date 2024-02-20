class BlogsController < ApplicationController
  before_action :authenticate_request, except: [:index]
  
  def index
    blogs = Blog.all

    render json: BlogBlueprint.render(blogs, view: :normal)
  end

  def show
    blog = Blog.find(params[:id])

    render json: blog
  end

  def create
    blog = Blog.new(blog_params)
    blog.user_id = @current_user.id
    blog.category_ids = params['category_ids']
    if blog.save
      render json: blog, status: :created
    else
      render json: blog.errors, status: :unprocessable_entity
    end
    
  end

  def update
    blog = Blog.find(params[:id])
    blog.assign_attributes(blog_params)
    if blog.save
      render json: blog, status: :ok
    else
      render json: blog.errors, status: :unprocessable_entity
    end
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy

    render json: blog
  end

  private

  def blog_params
    params.permit(:title, :content)
  end
end