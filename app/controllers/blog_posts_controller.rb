class BlogPostsController < ApplicationController

  def index
    cat_id = params[:category_id]
    if cat_id
      @blog_posts = BlogPost.where('category_id = ? ', cat_id)
      @blog_posts = @blog_posts.sort {|a, b| b.created_at <=> a.created_at}
    else
      @blog_posts = BlogPost.all
      @blog_posts = @blog_posts.sort {|a, b| b.created_at <=> a.created_at}
    end
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(params[:blog_post])
    @blog_post.owner = current_user
    @blog_post.category = Category.find(params[:category_id])
    @blog_post.likes = 0

    if current_user && @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.owner != current_user
      redirect_to posts_url, notice: 'Security violation'
      return
    end
    @blog_post.category = Category.find(params[:category_id])

    if @blog_post.update_attributes(params[:blog_post])
      redirect_to @blog_post, notice: 'Blog post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def like
    @result = 0
    blog_post = BlogPost.find(params[:id])
    if blog_post.owner != current_user
      blog_post.likes += 1
      blog_post.save
      @result = 1
    end
    render :file => 'blog_posts/like.json.erb', :content_type => 'application/json'
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.owner != current_user
      redirect_to posts_url, notice: 'Security violation'
      return
    end
    @blog_post.destroy
    redirect_to posts_url
  end
end
