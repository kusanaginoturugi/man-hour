class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :job_type_id
      t.string :title
      t.text :detail
      t.integer :cost
      t.string :place
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
