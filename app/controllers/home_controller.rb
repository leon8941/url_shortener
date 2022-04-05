class HomeController < ApplicationController
    def index
        @urls = Url.all
    end
end