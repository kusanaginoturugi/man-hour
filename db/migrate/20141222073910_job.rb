class Job < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :worktime, :float
  end
end
