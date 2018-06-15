class AlbumsController < ApplicationController
  before_action :require_login

  def index
    @albums = Album.all.includes(:band)
  end

  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks
  end
end
