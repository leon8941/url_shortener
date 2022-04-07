class UrlsController < ApplicationController
    before_action :set_url, only: [:update, :edit]

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

    def update
        if @url.update(url_params)
            redirect_to root_path, notice: 'Successfully updated new link'
        else
            flash[:error] = @url.errors.full_messages
            redirect_to edit_url_path
        end
    end

    def edit
    end

    def show
        @url = Url.find_by(short_url: params[:short_url])
        redirect_to @url.sanitize
    end

    private
    def url_params
        params.require(:url).permit(:target_url)
    end

    def set_url
        @url = Url.find(params[:id])
    end
end