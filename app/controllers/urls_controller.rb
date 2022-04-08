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
        target_url = url_params[:target_url]

        if @url.update(target_url: target_url)
            tags = url_params[:tags]

            UrlTag.where(url_id: @url.id).delete_all

            tags.each do |tag|
                @url.url_tags.create(title: tag)
            end

            redirect_to root_path, notice: 'Successfully updated new link'
        else
            flash[:error] = @url.errors.full_messages
            redirect_to edit_url_path
        end
    end

    def edit
        @url_tag_titles = @url.url_tags.pluck(:title)
    end

    def show
        @url = Url.find_by(short_url: params[:short_url])
        
        if @url.blank?
            redirect_to '/not_found'
        else
            redirect_to @url.sanitize, allow_other_host: true
        end
    end

    private
    def url_params
        params.require(:url).permit(:target_url, tags: [])
    end

    def set_url
        @url = Url.find(params[:id])
    end
end