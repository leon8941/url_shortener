class UrlTrace < ApplicationRecord
    belongs_to :url

    reverse_geocoded_by :latitude, :longitude do |obj,results|
        if geo = results.first
            obj.address = geo.address
            obj.city = geo.city
            obj.state = geo.state
            obj.state_code = geo.state_code
            obj.postal_code = geo.postal_code
            obj.country = geo.country
            obj.country_code = geo.country_code
        end
    end
      
    after_validation :reverse_geocode
end
