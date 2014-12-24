class Job < ActiveRecord::Migration
  def change
    add_column :jobs, :worktime, :float
  end
end
