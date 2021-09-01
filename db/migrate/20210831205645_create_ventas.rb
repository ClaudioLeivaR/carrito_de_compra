class CreateVentas < ActiveRecord::Migration[6.1]
  def change
    create_table :ventas do |t|
      t.string :codigo
      t.integer :valor_total
      t.date :fecha_pago
      t.string :voucher
      t.references :tipos_pago, null: false, foreign_key: true
      t.references :pedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end
