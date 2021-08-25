class Categoria < ApplicationRecord
    has_many :productos
    validates(:categoria, uniqueness: true)
    validates(:categoria, presence: true)
end
