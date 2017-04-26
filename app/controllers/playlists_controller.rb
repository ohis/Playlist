class PlaylistsController < ApplicationController
  def create

  end
  def add
    @song = Song.find(params[:id])
    @playlist = Playlist.new(song:@song, user:current_user)
     if @playlist.save
       @song.count+=1
       @song.save
     end
     redirect_to songs_path
  end

  def new
  end

  def index
  end
end
