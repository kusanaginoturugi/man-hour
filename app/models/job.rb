# coding: utf-8
class Job < ActiveRecord::Base
  attr_accessor :work_minutes
  belongs_to :job_type

  # スコープ
  default_scope -> { order('begin_date') }
  scope :monthly, ->(begin_date) { where("begin_date > ? and end_date < ?", begin_date.beginning_of_month, begin_date.end_of_month) }
  scope :summery, ->(begin_date) { where("begin_date > ? and end_date < ?", begin_date.beginning_of_month, begin_date.end_of_month) }

  after_find do
    self.work_minutes = (self.end_date - self.begin_date) / 60
  end

  before_save do
    if self.begin_date.present? and self.work_minutes.present? then
      self.end_date = self.begin_date + self.work_minutes.to_i * 60
    end
    self.worktime = (self.end_date - self.begin_date) / 60 / 60
  end
end
