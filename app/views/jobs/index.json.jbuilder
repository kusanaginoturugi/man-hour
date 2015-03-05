json.array!(@jobs) do |job|
  json.extract! job, :id, :job_type_id, :title, :detail, :outside_budget, :cost, :place, :begin_date, :end_date
  json.url job_url(job, format: :json)
end
