class Customer < ActiveRecord::Base
  has_many :jobs
  has_many :monthly_summaries
end
