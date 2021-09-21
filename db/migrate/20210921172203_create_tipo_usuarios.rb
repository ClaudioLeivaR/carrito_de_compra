class CreateTipoUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :tipo_usuarios do |t|
      t.string :tipo
      
      t.timestamps
    end
  end
end
