class Region < ApplicationRecord
    has_many :destinos

    validates(:nombre, uniqueness: true)
    validates(:nombre, presence: true)
end
