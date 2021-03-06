class BandsController < ApplicationController

    def index
        render :index
    end

    def show
        @band = Band.find(params[:id])
        if @band
            render :show
        else
            redirect_to bands_url
        end
    end

    def new
        render :new
    end

    def create
        @band = Band.new(band_params)
        
        if @band.save
            redirect_to band_url(@band)
        else
            redirect_to bands_url
        end
    end

    def edit
        @band = Band.find(params[:id])
        if @band
            render :edit
        else
            redirect_to bands_url
        end
    end

    def update
        @band = Band.find(params[:id])
        if @band.update(band_params)
            redirect_to band_url(@band)
        else
            redirect_to bands_url
        end
    end

    def destroy
        @band = Band.find(params[:id])
        @band.destroy
        redirect_to bands_url
    end

    private

    def band_params
        params.require(:band).permit(:name)
    end


end