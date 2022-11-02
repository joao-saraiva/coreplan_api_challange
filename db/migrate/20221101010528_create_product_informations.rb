class CreateProductInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :product_informations do |t|
      t.integer :ram_slot
      t.integer :max_ram
      t.boolean :onboard_graphics
      t.integer :cpu_support
      t.integer :product_id
      t.integer :gb_size

      t.timestamps
    end
  end
end
