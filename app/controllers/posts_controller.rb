class PostsController < ApplicationController

  def index
    # app/views/posts/index.html.erb
    # all of our blog posts

    # instance variables we define in our controller actions
    # get passed to the views
    @posts = Post.all

    render 'posts/index'
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save #=>

    if @post.save
      redirect_to post_path(@post) #/posts/1
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :author_name)
    end

end
