class DatosEnvio < ApplicationRecord

    attr_accessor   :destino_id

    has_many :pedidos
    validates(:nombre, presence: true)
    validates(:correo, presence: true)
    validates(:direccion, presence: true)
    validates(:telefono, presence: true)
end
