class CreateMonthlySummaries < ActiveRecord::Migration
  def change
    create_table :monthly_summaries do |t|
      t.integer :year
      t.integer :month
      t.datetime :begin_at
      t.datetime :end_at
      t.float :carryover_amount
      t.float :this_month_amount
      t.float :amount

      t.timestamps
    end
  end
end
