class AddColumnOutsideBudgetToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :outside_budget, :bool
  end
end
