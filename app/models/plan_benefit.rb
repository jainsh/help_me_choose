class PlanBenefit < ActiveRecord::Base
  belongs_to :plan
  belongs_to :service_cost
end
