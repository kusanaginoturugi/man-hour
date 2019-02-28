class AddCustomerIdToJob < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs,              :customer_id, :integer, after: :id
    add_column :monthly_summaries, :customer_id, :integer, after: :idyear
  end
end
