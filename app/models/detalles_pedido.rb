class DetallesPedido < ApplicationRecord
  belongs_to :producto
  belongs_to :pedido
end
