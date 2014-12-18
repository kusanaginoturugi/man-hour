# coding: utf-8
class Job < ActiveRecord::Base
  belongs_to :job_type

  # スコープ
  default_scope -> { order('begin_date') }
end
