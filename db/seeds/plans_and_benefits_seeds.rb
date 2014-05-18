puts "Loading Plans ..."

plan_attributes = [
  # PPO 70
  {
    code: "PPO70",
    name: "PPO 70",
    monthly_premium: "350",
    annual_deductible: "3000",
    max_oop: "5500",
    coinsurance: "70",
  },
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
plan_attributes.each_with_index do |pattribs, sort_order|
  pattribs[:sort_order] = sort_order
  plan = Plan.find_by_code(pattribs[:code])
  if plan.present?
    plan.update_attributes!(pattribs)
  else
    plan = Plan.new(pattribs)
    plan.save!
  end
end

puts "Loading Plan Benefits ..."
benefits_csv = "db/seeds/benefits.csv"
require 'csv'
CSV.foreach(benefits_csv, :headers => true) do |values|
  values = values.to_hash
  plan = Plan.find_by_code(values['plan']) || raise("Plan with code #{values['code']} not found.")
  service = ServiceCost.find_by_name(values['benefit']) || raise("Benefit with name #{values['benefit']} not found.")
  benefit = PlanBenefit.find_by_plan_id_and_service_cost_id(plan.id, service.id)
  attribs = {
    plan: plan,
    service_cost: service,
    copay: values['copay'],
    coinsurance: values['coinsurance'] == 'Y'
  }
  if benefit
    benefit.update_attributes!(attribs)
  else
    benefit = PlanBenefit.new(attribs)
    benefit.save!
  end
end
