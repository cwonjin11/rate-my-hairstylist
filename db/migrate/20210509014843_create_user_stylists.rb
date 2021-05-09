class CreateUserStylists < ActiveRecord::Migration[6.1]
  def change
    create_table :user_stylists do |t|
      t.date :haircut_date
      t.integer :stars
      t.string :comment
      t.string :services
      t.float :price
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :stylist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
