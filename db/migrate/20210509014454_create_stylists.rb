class CreateStylists < ActiveRecord::Migration[6.1]
  def change
    create_table :stylists do |t|
      t.string :name
      t.integer :phone
      t.string :shop_name
      t.string :address

      t.timestamps
    end
  end
end
