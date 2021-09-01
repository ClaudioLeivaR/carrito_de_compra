class Destino < ApplicationRecord
  belongs_to :region

  validates(:nombre, presence: true)
  validates(:region_id, presence: true)
  
end
