class UrlTag < ApplicationRecord
    belongs_to :url

    validates :title, uniqueness: { scope: :url_id, message: "shouldn't duplicate" }
end
