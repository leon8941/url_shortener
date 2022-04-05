class UrlsController < ApplicationController
    def index
        @urls = Url.all
    end

    def new
        @url = Url.new
    end

    def create
        @url = Url.new(url_params)

        user_id = @_current_user.id

        @url.user_id = user_id
        @url.short_url = @url.generate_short_url
        @url.target_url = @url.sanitize

        if @url.save
            redirect_to root_path, notice: 'Successfully created new link'
        else
            flash[:error] = @url.errors.full_messages
            redirect_to new_url_path
        end
    end

    def show
        @url = Url.find_by(short_url: params[:short_url])
        redirect_to @url.sanitize
    end

    private
    def url_params
        params.require(:url).permit(:target_url)
    end
end