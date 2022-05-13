class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    has_and_belongs_to_many :recipes
    has_secure_password
    validates :password, length: { minimum: 6 }
end
