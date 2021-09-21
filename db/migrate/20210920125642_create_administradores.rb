class CreateAdministradores < ActiveRecord::Migration[6.1]
  def change
    create_table :administradores do |t|
      t.string :correo
      t.string :password_digest
      t.string :nombre

      t.timestamps
    end
  end
end
