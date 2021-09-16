class Pedido < ApplicationRecord
  
  
  belongs_to :destino, optional: true
  belongs_to :datos_envio
  belongs_to :estados_pedido

  has_one :venta
  has_many :detalles_pedidos,-> {order(id: :asc)}
  has_many :productos, through: :detalles_pedidos

end
