class User < ApplicationRecord
    has_secure_password
    has_many :urls

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
