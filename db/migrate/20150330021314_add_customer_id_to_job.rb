class AddCustomerIdToJob < ActiveRecord::Migration
  def change
    add_column :jobs,              :customer_id, :integer, after: :id
    add_column :monthly_summaries, :customer_id, :integer, after: :idyear
  end
end
