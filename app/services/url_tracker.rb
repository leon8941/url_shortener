class UrlTracker < ApplicationService
    attr_reader :url
    
    def initialize(url, longitude, latitude)
        @url = url
        @longitude = longitude
        @latitude = latitude
    end
  
    def call
        @url.clicks = @url.clicks + 1

        unless @longitude.blank? && @latitude.blank?
            @url.url_traces.create(longitude: @longitude, latitude: @latitude)
        end

        @url.save
    end
  end