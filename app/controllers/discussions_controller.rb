class DiscussionsController < ApplicationController
  before_action :set_discussion, only: %i[ show edit update destroy ]
  before_action :find_channels, only: [:index, :show, :new, :edit]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /discussions or /discussions.json
  def index
    @discussions = Discussion.all.order('created_at desc')
    @channels = Channel.all.page(params[:page]).per(2)
  end

  # GET /discussions/1 or /discussions/1.json
  def show
    @discussions = Discussion.all.order('created_at desc')
    @channels = Channel.all.page(params[:page]).per(2)
  end

   def archive
    # @discussion = Discussion.find(params[:id])
    @discussions = Discussion.only_deleted
    # @discussions = Discussion.readonly.with_deleted.find(params[:id])
    # @discussions = Discussion.with_deleted
   end
  # GET /discussions/new
  def new
    @discussion = current_user.discussions.new
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions or /discussions.json
  def create
    @discussion = current_user.discussions.new(discussion_params)
    @discussion.save
    @channels = Channel.all.page(params[:page]).per(2)
    respond_to do |format|
      if @discussion.save
        format.html { redirect_to discussion_url(@discussion), notice: "Discussion was successfully created." }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end  
  end  

  # PATCH/PUT /discussions/1 or /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to discussion_url(@discussion), notice: "Discussion was successfully updated." }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1 or /discussions/1.json
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to discussions_url, notice: "Discussion was successfully destroyed." }
      format.json { head :no_content }
    end
  end     

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discussion
      # @discussion = Discussion.find(params[:id])
      @discussion = Discussion.find(params[:id])
    end

    def find_channels
      @channels =Channel.all.order('created_at desc')
    end

    # Only allow a list of trusted parameters through.
    def discussion_params
      params.require(:discussion).permit(:title, :content, :channel_id, :contents)
      # params.fetch(:discussion, {}).permit(:contents) 
    end
end
