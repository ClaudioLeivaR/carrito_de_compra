class CreateEstadosPedidos < ActiveRecord::Migration[6.1]
  def change
    create_table :estados_pedidos do |t|
      t.string :estado

      t.timestamps
    end
  end
end
