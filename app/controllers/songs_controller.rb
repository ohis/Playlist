class SongsController < ApplicationController

  def index
    @current_user = current_user
   @songs = Song.order(created_at: :desc).all.includes(:playlists)
  #  @songs = Song.includes(:playlists).all
  end
  def create
    @song = Song.new(title:params[:title], artist:params[:artist], count:0)
    if@song.save
      flash[:success] = 'You have successfully added a song'
      redirect_to songs_path
    else
      flash[:error] = @song.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @song = Song.find(params[:id])
  #  @users = Playlist.where(song: @song)
    @users = Playlist.where(song_id:params[:id]).group_by(&:user)
  end

  def new
  end


end
