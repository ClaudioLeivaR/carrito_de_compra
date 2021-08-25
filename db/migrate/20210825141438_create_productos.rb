class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.float :precio
      t.string :descripcion
      t.integer :cantidad
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
