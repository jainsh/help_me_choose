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

# == Schema Information
#
# Table name: plan_benefits
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  coinsurance     :integer          default(0)
#  copay           :integer          default(0)
#  plan_id         :integer
#  service_cost_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class PlanBenefit < ActiveRecord::Base
  belongs_to :plan
  belongs_to :service_cost
end
