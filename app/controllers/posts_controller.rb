class PostsController < ApplicationController
  # GET /posts
  def index
    render json: Post.all
  end

  # GET /post/id
  def show
    render json: Post.find_by(id: params[:id])
  end

  # POST /posts
  def create
    post = Post.create(post_params)
    render json: post
  end

  private

  def found_post
    Post.find_by(id: params[:id])
  end

  def post_params
    params.permit(:title, :content, :summary, :category, :author_id)
  end
end
