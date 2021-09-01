class CreateDatosEnvios < ActiveRecord::Migration[6.1]
  def change
    create_table :datos_envios do |t|
      t.string :nombre
      t.string :direccion
      t.string :correo
      t.string :telefono

      t.timestamps
    end
  end
end
