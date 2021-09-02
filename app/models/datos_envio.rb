class DatosEnvio < ApplicationRecord
    has_many :pedidos
    validates(:nombre, presence: true)
    validates(:correo, presence: true)
    validates(:direccion, presence: true)
    validates(:telefono, presence: true)
end
