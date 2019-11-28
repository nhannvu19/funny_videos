module VideosHelper
  def youtube_url(video)
    id  = video.url.split('v=').last
    "https://youtube.com/embed/#{id}"
  end
end
