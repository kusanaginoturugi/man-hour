# coding: utf-8
class Job < ActiveRecord::Base
  # スコープ
  default_scope -> { order('begin_date') }
end
