class TiposPago < ApplicationRecord
    has_many :ventas

    validates(:pago, uniqueness: true)
    validates(:pago, presence: true)
end
