class Api::V1::PostsController < ApplicationController
  # before_action :authenticate_account!, except: %i[index show]
  before_action :set_post, only: %i[show update destroy increment_view_count close]

  # GET /posts
  def index
    @posts = Post.includes(:community, :account)
    @posts_sorted_by_view_count = @posts.order(view_count: :desc)
    @posts_sorted_by_creation_time = @posts.order(created_at: :desc)
    @posts_sorted_by_upvotes = @posts.order(upvotes: :desc)
    @best_posts = @posts.sort_by { |post| post.upvotes.to_f / (post.upvotes + post.downvotes + 1) }.reverse
    render json: {
      posts: @posts,
      top_posts: @posts_sorted_by_view_count,
      new_posts: @posts_sorted_by_creation_time,
      hot_posts: @posts_sorted_by_upvotes,
      best_posts: @best_posts
    }, include: %i[community account]
  end
  
  def increment_view_count
    @post.view_count += 1
    @post.save
  end 

  # GET /posts/1
  def show
    increment_view_count
    render json: @post, include: %i[community account]
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
    posts = Post.where('title LIKE ?', "%#{params[:q]}%").select(:id, :title, :community_id, :body, :account_id)
    communities = Community.where('name LIKE ?', "%#{params[:q]}%").select(:id, :name)
    accounts = Account.where('username LIKE ?', "%#{params[:q]}%").select(:id, :username)
    comments = Comment.where('message LIKE ?', "%#{params[:q]}%").select(:id, :message, :post_id, :account_id,
                                                                         :parent_id, :created_at)

    comments.each do |comment|
      post = posts.find { |p| p.id == comment.post_id }
      comment.community_id = post.community_id if post
      comment.post_title = post.title if post
    end

    comments.each do |comment|
      account = accounts.find { |acc| acc.id == comment.account_id }
      comment.username = account.username if account
    end
    data = {
      posts: { options: posts, type: 'post' },
      communities: { options: communities, type: 'community' },
      accounts: { options: accounts, type: 'account' },
      comments: { options: comments, type: 'comment' }
    }
    render json: data
  end

  def close
    @post.update(isclosed: 'true')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.includes(:account, :community).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:account_id, :community_id, :title, :body, :upvotes, :downvotes, :total_comments,
                                 :is_drafted, :isclosed)
  end
end
