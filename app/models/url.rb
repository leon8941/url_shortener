class Url < ApplicationRecord
    belongs_to :user
    
    has_many :url_tags
end
