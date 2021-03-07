class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,          null: false
      t.integer    :category_id,   null: false
      t.integer    :state_id,      null: false
      t.integer    :province_id,   null: false
      t.integer    :souryou_id,    null: false
      t.integer    :day_id,        null: false
      t.integer    :price,         null: false
      t.text       :comment,       null: false
      t.references :user

      t.timestamps
    end
  end
end
