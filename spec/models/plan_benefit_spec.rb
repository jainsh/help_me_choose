# == Schema Information
#
# Table name: plan_benefits
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  coinsurance     :boolean          default(FALSE)
#  copay           :integer          default(0)
#  plan_id         :integer
#  service_cost_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe PlanBenefit do
  pending "add some examples to (or delete) #{__FILE__}"
end
