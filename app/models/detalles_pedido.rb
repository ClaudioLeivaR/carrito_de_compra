class DetallesPedido < ApplicationRecord
  after_save :actualizar_total
  after_destroy :actualizar_total
  
  belongs_to :producto
  belongs_to :pedido

  private

  def actualizar_total
    pedido = self.pedido
    subtotal = 0
    pedido.detalles_pedidos.each do |detalle|
      subtotal += detalle.cantidad * detalle.producto.precio
    end
    pedido.total = subtotal
    pedido.save
  end
  
end
