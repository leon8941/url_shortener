class UrlsController < ApplicationController
    before_action :set_url, only: [:update, :edit, :show, :destroy]
    before_action :set_coordinates, only: [:show, :get_url]

    def new
        @url = Url.new
    end

    def show
        @daily_visits = @url.url_traces.group_by_day(:created_at)
        @visit_no_by_countries = @url.url_traces.where.not(country: nil).group(:country)
    end

    def edit
        @url_tag_titles = @url.url_tags.pluck(:title)
    end

    def create
        @url = Url.new(url_params)

        user_id = @_current_user.id

        @url.user_id = user_id
        @url.short_url = @url.generate_short_url
        
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
            tags = url_params[:tags] || []

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

    def destroy
        Url.where(id: @url.id).destroy_all

        redirect_to root_path, notice: 'Successfully deleted url'
    end

    def get_url
        @url = Url.find_by(short_url: params[:short_url])

        if @url.blank?
            redirect_to '/not_found'
        else
            @url.clicks = @url.clicks + 1

            unless @longitude.blank? && @latitude.blank?
                @url.url_traces.create(longitude: @longitude, latitude: @latitude)
            end

            @url.save

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

    def set_coordinates
        location = request.location
        @longitude = location.longitude
        @latitude = location.latitude
    end
end