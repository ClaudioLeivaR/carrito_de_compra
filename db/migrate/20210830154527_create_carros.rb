class CreateCarros < ActiveRecord::Migration[6.1]
  def change
    create_table :carros do |t|
      t.float :total

      t.timestamps
    end
  end
end
