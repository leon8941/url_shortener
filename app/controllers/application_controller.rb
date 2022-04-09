class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :set_hostname

    private
    def set_current_user
        @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
        @user_decorator = helpers.decorate(@_current_user) unless @_current_user.nil?
    end

    private
    def set_hostname
        @hostname = ENV.fetch("RAILS_ENV", "development") == "development" ? request.host_with_port : request.host
    end

    def logged_in?
        !!@_current_user
    end
end
