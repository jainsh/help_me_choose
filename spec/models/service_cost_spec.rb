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

require 'spec_helper'

describe ServiceCost do
  pending "add some examples to (or delete) #{__FILE__}"
end
