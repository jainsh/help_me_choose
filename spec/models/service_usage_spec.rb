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

require 'spec_helper'

describe ServiceUsage do
  pending "add some examples to (or delete) #{__FILE__}"
end
