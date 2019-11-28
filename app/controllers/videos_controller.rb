class VideosController < ApplicationController
  before_action :authenticate_user!, except: :index

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/new
  def new
    @video = current_user.videos.new
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = current_user.videos.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to videos_path, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        flash[:error] = @video.errors.full_messages.join(', ')
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_video
      @video = current_user.videos.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:user_id, :url)
    end
end
