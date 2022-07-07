class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to (@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_url
        end
    end

    def show
        @user = User.find(params[:id])
        if @user
            render :show
        else
            render json: "Not found", status: 404
        end

    end

    def update

    end

    private
    def user_params
        params.require(:user).permit(:email,:password)
    end
end