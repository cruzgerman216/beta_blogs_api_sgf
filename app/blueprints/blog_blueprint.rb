class BlogBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :content, :cover_image_url

  view :normal do
    association :user, blueprint: UserBlueprint, view: :normal

    field :liked do |blog, options| 
      current_user = options[:current_user]
      blog.liked?(current_user)
    end

    field :likes_count do |blog, options|
        blog.likes.count
    end

  end
end
