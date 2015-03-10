json.array!(@monthly_summaries) do |monthly_summary|
  json.extract! monthly_summary, :id, :year, :month, :begin_at, :end_at, :carryover_amount, :this_month_amount, :amount
  json.url monthly_summary_url(monthly_summary, format: :json)
end
