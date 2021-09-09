class Carro < ApplicationRecord

    has_many :carros_contenidos, -> {order(id: :asc)}, dependent: :destroy
    has_many :productos, through: :carros_contenidos

    
end
