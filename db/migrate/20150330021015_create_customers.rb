class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :short_name
      t.string :name
      t.string :post
      t.string :address1
      t.string :address2
      t.string :rep

      t.timestamps
    end
  end
end
