class Url < ApplicationRecord
    belongs_to :user
    has_many :url_tags

    validates :short_url, length: { maximum: 15 }
    before_create :generate_short_url, :sanitize

    def generate_short_url
        rand(36**8).to_s(36)
    end
    
    def sanitize
        target_url.strip!
        sanitize_url = self.target_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
        "http://#{sanitize_url}"
    end
end
