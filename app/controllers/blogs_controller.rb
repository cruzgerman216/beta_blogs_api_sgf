class BlogsController < ApplicationController
  before_action :authenticate_request
  
  def index
    blogs = Blog.all

    render json: BlogBlueprint.render(blogs, view: :normal, current_user: @current_user)
  end

  def show
    blog = Blog.find(params[:id])

    render json: BlogBlueprint.render(blog)
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

  def like 
    # establish the like between user and blog 
    # params -> blog_id
    # @current_user
    blog = Blog.find(params[:blog_id])
    like = blog.likes.new(user_id: @current_user.id)
    blog_creator = blog.user 

    if like.save 
      # if saved correctly, notify creator in real time
      Pusher.trigger(blog_creator.id, 'like', {
        blog_id: blog.id, 
        notification: "#{@current_user.username} has liked #{blog.title}"
      })

      # create a notification record

      head :ok 
    else 
      render json: nil, status: :unprocessable_entity
    end
    # otherwise, send error 
  end

  def unlike 
    blog = Blog.find(params[:blog_id])
    like = blog.likes.find_by(user_id: @current_user.id)

    if like.destroy 
      head :ok 
    else 
      render json: nil, status: :unprocessable_entity
    end

  end

  private

  def blog_params
    params.permit(:title, :content, :cover_image)
  end
end