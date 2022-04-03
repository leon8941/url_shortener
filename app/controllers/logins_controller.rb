class LoginsController < ApplicationController
    def new
        if logged_in?
            flash[:notice] = "You are already login."
            redirect_to root_url
        end
    end

    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            redirect_to root_path, notice: 'Logged in successfully'
        else
            redirect_to :logins, notice: "Invalid email or Wrong password"
        end
    end

    def destroy
        session.delete(:current_user_id)
        @_current_user = nil
        flash[:notice] = "You have successfully logged out."
        redirect_to root_url
    end
end