class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

    t.integer :customer_id, null: fulse, default: ""
    t.string :name, null: fulse, default: ""
    t.string :postal_code, null: fulse, default: ""
    t.string :address, null: fulse, default: ""

      t.timestamps
    end
  end
end
