class CreateCarrosContenidos < ActiveRecord::Migration[6.1]
  def change
    create_table :carros_contenidos do |t|
      t.references :carro, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.integer :cantidad

      t.timestamps
    end
  end
end
