class Producto < ApplicationRecord
    # TODO: para clientes con rut \d{1,2}\.\d{3}\.\d{3}[-][0-9kK]{1}
    

    belongs_to :categoria
    
    belongs_to :estados_producto

    has_many_attached :imagenes

    has_many :carros_contenidos
    has_many :carros, through: :carros_contenidos

    has_many :detalles_pedidos
    has_many :pedidos, through: :detalles_pedidos

    validates(:nombre, presence: true)
    validates(:nombre, uniqueness: true)

    validates(:precio, presence: true)
    validates(:precio,numericality: { greater_than: 0})

    validates(:descripcion, presence: true)
    
    validates(:cantidad, presence: true)
    validates(:cantidad, numericality: { greater_than: 0})

    validates(:categoria_id,    presence: true)

    validate(:max_imagenes)

    private

    def max_imagenes
        
        if self.imagenes.count > 4
            self.errors.add(:imagenes, "No puedes cargar mas de 4 fotos")
        #self.errors[:imagenes] = "No puedes agregar mas de 4 fotos"
        end
    
    end

end
