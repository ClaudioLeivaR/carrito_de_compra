class CreateDetallesPedidos < ActiveRecord::Migration[6.1]
  def change
    create_table :detalles_pedidos do |t|
      t.integer :cantidad
      t.references :producto, null: false, foreign_key: true
      t.references :pedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end
