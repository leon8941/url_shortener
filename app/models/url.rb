class Url < ApplicationRecord
    belongs_to :user
    has_many :url_tags, dependent: :destroy
    has_many :url_traces, dependent: :destroy

    validates :short_url, length: { maximum: 15 }
    validates :target_url, presence: true
    before_create :generate_short_url, :sanitize

    def generate_short_url
        rand(36**8).to_s(36)
    end
    
    def sanitize
        target_url.strip!
        sanitize_url = self.target_url.gsub(/(https?:\/\/)|(www\.)/, "")
        "http://#{sanitize_url}"
    end
end
