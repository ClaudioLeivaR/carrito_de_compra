class Carro < ApplicationRecord

    has_many :carros_contenidos
    has_many :productos, through: :carros_contenidos

    
end
