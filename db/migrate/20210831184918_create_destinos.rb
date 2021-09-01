class CreateDestinos < ActiveRecord::Migration[6.1]
  def change
    create_table :destinos do |t|
      t.string :nombre
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
