class Api::V1::CommunitiesController < ApplicationController
  # before_action :authenticate_account!, except: [:index]
  before_action :set_community, only: %i[show update destroy]

  # GET /communities
  def index
    @communities = Community.all

    render json: @communities
  end

  # GET /communities/1
  def show
    # @posts = @community.posts
    render json: @community, include: [:posts]
  end

  # POST /communities
  def create
    @community = Community.new(community_params)

    if @community.save
      render json: @community, status: :created
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /communities/1
  def update
    if @community.update(community_params)
      render json: @community
    else
      render json: @community.errors, status: :unprocessable_entity
    end
  end

  def search_suggestions
    communities = Community.where('name LIKE ?', "%#{params[:q]}%").select(:id, :name)
    render json: { options: communities }
  end

  # DELETE /communities/1
  def destroy
    @community.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_community
    @community = Community.includes(:posts).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def community_params
    params.require(:community).permit(:name, :url, :rules, :total_members, :account_id)
  end
end
