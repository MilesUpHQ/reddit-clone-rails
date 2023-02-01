class Api::V1::PostsController < ApplicationController
  # before_action :authenticate_account!, except: %i[index show]
  before_action :set_post, only: %i[show update destroy]

  # GET /posts
  def index
    @posts = Post.includes(:community)
    render json: @posts, include: [:community]
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
  end

  def navbar_search
    posts = Post.where("title LIKE ?", "%#{params[:q]}%").select(:id, :title)
    communities= Community.where("name LIKE ?", "%#{params[:q]}%").select(:id, :name)
    accounts=Account.where("username LIKE ?", "%#{params[:q]}%").select(:id, :username)
    comments = Comment.where("message LIKE ?", "%#{params[:q]}%").select(:id, :message)
    data = { 
      posts: { options: posts, type: 'post' }, 
      communities: { options: communities, type: 'community' }, 
      accounts: { options: accounts, type: 'account' },
      comments: { options: comments, type: 'comment'}
    }
    render json: data
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:account_id, :community_id, :title, :body, :upvotes, :downvotes, :total_comments,
                                 :is_drafted)
  end
end
