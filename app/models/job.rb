# coding: utf-8
class Job < ApplicationRecord
  attr_accessor :work_minutes
  belongs_to :job_type
  belongs_to :customer

  # スコープ
  default_scope -> { order('begin_date') }
  scope :monthly, ->(c_id, begin_date) { where("customer_id = ? AND begin_date > ? AND end_date < ?", c_id, begin_date.beginning_of_month, begin_date.end_of_month) }
  scope :summery, ->(c_id, begin_date) { where("customer_id = ? AND begin_date > ? AND end_date < ?", c_id, begin_date.beginning_of_month, begin_date.end_of_month) }

  after_find do
    self.work_minutes = (self.end_date - self.begin_date) / 60
  end

  before_save do
    if self.begin_date.present? and self.work_minutes.present?
      self.end_date = self.begin_date + self.work_minutes.to_i * 60
    end
    self.worktime = 0
    if self.end_date.present? and self.begin_date.present?
      self.worktime = (self.end_date - self.begin_date) / 60 / 60
    end
  end

  after_save do
    summary_save
  end

  def summary_save
    w_hours   = 18
    c_id  = self.customer_id
    date  = self.begin_date
    year  = date.year
    month = date.month

    begin_at   = date.beginning_of_month.beginning_of_day
    end_at     = date.end_of_month.end_of_day
    amount     = Job.where(customer_id: c_id, begin_date: begin_at..end_at, outside_budget: false).sum(:worktime)

    prev_date  = date.prev_month
    prev_year  = prev_date.year
    prev_month = prev_date.month

    prev_begin_at = prev_date.beginning_of_month.beginning_of_day
    prev_end_at   = prev_date.end_of_month.end_of_day
    prev_amount   = Job.where(customer_id: c_id, begin_date: prev_begin_at..prev_end_at, outside_budget: false).sum(:worktime)

    loop do
      msum      = MonthlySummary.where(customer_id: c_id, year: year, month: month).first
      msum_prev = MonthlySummary.where(customer_id: c_id, year: prev_year, month: prev_month).first
      if msum.blank? and msum_prev.blank?
        MonthlySummary.create(customer_id: c_id, year: prev_year, month: prev_month, begin_at: prev_begin_at, end_at: prev_end_at, carryover_amount: 0, this_month_amount: prev_amount, amount: prev_amount - w_hours)
      elsif msum.blank? and msum_prev.present?
        MonthlySummary.create(customer_id: c_id, year: year, month: month, begin_at: begin_at, end_at: end_at, carryover_amount: msum_prev.amount, this_month_amount: amount, amount: msum_prev.amount + amount - w_hours)
        break
      elsif msum.present? and msum_prev.present?
        msum.begin_at          = begin_at
        msum.end_at            = end_at
        msum.carryover_amount  = msum_prev.amount
        msum.this_month_amount = amount
        msum.amount            = msum_prev.amount + amount - w_hours
        msum.save
        break
      else
        break
      end
    end

  end
end
