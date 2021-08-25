class CreateCategorias < ActiveRecord::Migration[6.1]
  def change
    create_table :categorias do |t|
      t.string :categoria

      t.timestamps
    end
  end
end
