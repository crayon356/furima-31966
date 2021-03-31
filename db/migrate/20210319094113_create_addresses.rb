class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code, null: false
      t.integer    :province_id,  null: false
      t.string     :city,        null: false
      t.string     :address,     null: false
      t.string     :building
      t.string     :telephone,   null: false
      t.references :buyer,       null: false,  foreign_key: true

      t.timestamps
    end
  end
end
