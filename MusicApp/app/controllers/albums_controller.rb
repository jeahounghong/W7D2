class AlbumsController < ApplicationController

    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.new(album_params)
        @album.band_id = @album.band_id.to_i
        @album.live = to_boolean(@album.live)
        p @album
        if @album.save
            redirect_to album_url(@album)
        else
            redirect_to albums_url
        end
    end

    def update
        @album = Album.find(params[:id])
        render :update
    end

    def index
        render :index
    end

    def show
        @album = Album.find(params[:id])
        if @album
            render :show
        else
            redirect_to albums_url
        end
    end

    private

    def album_params
        params.require(:album).permit(:live, :title, :band_id, :year)
    end
end