class CreateTiposPagos < ActiveRecord::Migration[6.1]
  def change
    create_table :tipos_pagos do |t|
      t.string :pago

      t.timestamps
    end
  end
end
