# == Schema Information
#
# Table name: service_usages
#
#  id               :integer          not null, primary key
#  usage_count      :integer          default(1)
#  service_cost_id  :integer
#  usage_profile_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class ServiceUsage < ActiveRecord::Base
  belongs_to :service_cost
  belongs_to :usage_profile

  def benefit_for(plan)
    PlanBenefit.where(plan_id: plan.id, service_cost_id: service_cost.id).first
  end
end
