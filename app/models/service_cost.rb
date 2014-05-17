class ServiceCost < ActiveRecord::Base
  has_many :plan_benefits
  has_many :service_usages
end
