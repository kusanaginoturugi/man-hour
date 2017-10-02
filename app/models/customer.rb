class Customer < ApplicationRecord
  has_many :jobs
  has_many :monthly_summaries
end
