class Venta < ApplicationRecord
  belongs_to :tipos_pago
  belongs_to :pedido
end
