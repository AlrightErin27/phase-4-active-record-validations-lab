class AuthorsController < ApplicationController
  # GET /authors
  def index
    render json: Author.all
    # ALL AUTHORS MUST HAVE A NAME
    # NO AUTHORS HAVE SAME NAME
    # ALL PHONE NUMBERS ARE 8 DIGITS
  end

  # GET /authors/id
  def show
    render json: found_author
    # ALL PHONE NUMBERS ARE 8 DIGITS
  end

  # GET /authors/:id/posts
  def theirposts
    author = found_author
    arr = ["#{author.name}'s Posts:"]
    count = 1
    Post.all.each do |post|
      (arr << "#{count}. #{post.title}") && (count = count + 1) if (
        post.author_id == author.id
      )
    end
    render json: arr
  end

  # POST /authors
  def create
    author = Author.create(author_params)
    render json: author, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end

  # PATCH /authors/:id
  def update
    author = found_author
    author.update(author_params)
    render json: author
    # ALL AUTHORS MUST HAVE A NAME
    # NO AUTHORS HAVE SAME NAME
    # ALL PHONE NUMBERS ARE 8 DIGITS
  end

  private

  def found_author
    Author.find_by(id: params[:id])
  end
  def author_params
    params.permit(:name, :phone_number)
  end
end
