class Api::V1::PostsController < ApplicationController
  # before_action :authenticate_account!, except: %i[index show]
  before_action :set_post, only: %i[show update destroy close]

  # GET /posts
  def index
    @posts = Post.includes(:community, :account)
    render json: @posts, include: %i[community account]
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
    posts = Post.where("title LIKE ?", "%#{params[:q]}%").select(:id, :title, :community_id, :body)
    communities= Community.where("name LIKE ?", "%#{params[:q]}%").select(:id, :name)
    accounts=Account.where("username LIKE ?", "%#{params[:q]}%").select(:id, :username)
    comments = Comment.where("message LIKE ?", "%#{params[:q]}%").select(:id, :message, :post_id)

    comments.each do |comment|
      post = posts.find { |p| p.id == comment.post_id }
      comment.community_id = post.community_id if post
    end
    
    data = { 
      posts: { options: posts, type: 'post' }, 
      communities: { options: communities, type: 'community' }, 
      accounts: { options: accounts, type: 'account' },
      comments: { options: comments, type: 'comment'}
    }
    render json: data
  end

  def close
    @post.update(isclosed: 'true')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:account_id, :community_id, :title, :body, :upvotes, :downvotes, :total_comments,
                                 :is_drafted, :isclosed)
  end
end
