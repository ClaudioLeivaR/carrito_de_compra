class CarrosContenido < ApplicationRecord

  before_save :actualizar_total


  belongs_to :carro
  belongs_to :producto

  private

    def actualizar_total
        
        self.carro.total = self.carro.productos.map(&:precio).sum # el ampersan & es = a {|producto|producto.precio}
        self.carro.save
      end

end
