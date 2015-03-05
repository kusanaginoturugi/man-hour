class AddColumnOutsideBudgetToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :outside_budget, :bool
  end
end
