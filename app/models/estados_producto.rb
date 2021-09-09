class EstadosProducto < ApplicationRecord
    has_many :productos

    validates(:estado, uniqueness: true)
    validates(:estado, presence: true)
end
