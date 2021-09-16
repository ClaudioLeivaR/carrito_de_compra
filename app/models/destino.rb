class Destino < ApplicationRecord
  belongs_to :region
  has_many :pedidos
  
  validates(:nombre, presence: true)
  validates(:region_id, presence: true)
  
end
