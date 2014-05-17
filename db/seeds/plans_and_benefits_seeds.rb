puts "Loading Plans ..."

plan_attributes = [
  # PPO 80
  {
    code: "PPO80",
    name: "PPO 80",
    monthly_premium: "500",
    annual_deductible: "2500",
    max_oop: "4500",
    coinsurance: "80",
  },
  # PPO 80
  {
    code: "HD6000",
    name: "High Deductible 6000",
    monthly_premium: "100",
    annual_deductible: "6000",
    max_oop: "6000",
    coinsurance: "100",
  },
]
plan_attributes.each do |pattribs|
  plan = Plan.find_by_code(pattribs[:code])
  if plan.present?
    plan.update_attributes!(pattribs)
  else
    plan = Plan.new(pattribs)
    plan.save!
  end
end
