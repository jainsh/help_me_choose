# == Schema Information
#
# Table name: service_costs
#
#  id         :integer          not null, primary key
#  name       :string(100)
#  cost       :integer
#  created_at :datetime
#  updated_at :datetime
#  order      :integer          default(0)
#

class ServiceCost < ActiveRecord::Base

end
