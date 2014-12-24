# coding: utf-8
class Job < ActiveRecord::Base
  belongs_to :job_type

  # スコープ
  default_scope -> { order('begin_date') }
  scope :monthly, ->(begin_date) { where("begin_date > ? and end_date < ?", begin_date.beginning_of_month, begin_date.end_of_month) }
  scope :summery, ->(begin_date) { where("begin_date > ? and end_date < ?", begin_date.beginning_of_month, begin_date.end_of_month) }

  before_save do
    self.worktime = (self.end_date - self.begin_date) / 60 / 60
  end
end
