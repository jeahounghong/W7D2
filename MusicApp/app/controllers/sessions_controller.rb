class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] =["Invalid login credentials"]
            redirect_to new_session_url
        end
    end

    def destroy
        logged_out_user = current_user.email
        logout!
        flash[:success] = "#{logged_out_user} has successfully logged out!"
        redirect_to new_session_url
    end

end