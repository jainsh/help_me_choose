class ServiceUsage < ActiveRecord::Base
  belongs_to :service_cost
  belongs_to :usage_profile
end
