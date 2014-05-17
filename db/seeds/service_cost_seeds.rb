puts "Loading ServiceCost(s)..."

services_data = [
  ["Wellness Visits", "185"],
  ["Cardio Stress Test", "1300"],
  ["Mammogram's", "330"],
  ["Colonoscopy", "1000"],
  ["Dermatologist", "210"],
  ["Physical Therapy", "1000"],
  ["Lab/Blood Tests", "77"],
  ["MRI's", "800"],
  ["Rx. Generic", "10"],
  ["Rx. Specialty", "100"],
]


service_cost_ids = []
services_data.each_with_index do |values, order|
  name = values.first
  cost = values.last
  service = ServiceCost.find_by_name(name)
  if service
    service.update_attributes!(
      cost: cost,
      order: order
    )
  else
    service = ServiceCost.new(
      name: name,
      cost: cost,
      order: order
    )
    service.save!
  end
  service_cost_ids << service.id
end

# delete the older ones
ServiceCost.where("id not in (?)", service_cost_ids).destroy_all
