class Producto < ApplicationRecord
    belongs_to :categoria
    has_many_attached :imagenes

    validates(:nombre, presence: true)
    validates(:nombre, uniqueness: true)

    validates(:precio, presence: true)
    validates(:descripcion, presence: true)
    validates(:cantidad, presence: true)

end
