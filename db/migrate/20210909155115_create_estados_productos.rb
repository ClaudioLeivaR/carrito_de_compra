class CreateEstadosProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :estados_productos do |t|
      t.string :estado

      t.timestamps
    end
  end
end
