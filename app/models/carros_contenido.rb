class CarrosContenido < ApplicationRecord
  belongs_to :carro
  belongs_to :producto
end
