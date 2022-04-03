class RegistersController < ApplicationController
    def new
        if logged_in?
            flash[:notice] = "You are already login."
            redirect_to root_url
        end
        
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:current_user_id] = @user.id
            redirect_to root_path, notice: 'Successfully created account'
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password_confirmation, :password)
    end
end