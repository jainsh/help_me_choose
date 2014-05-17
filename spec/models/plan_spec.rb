# == Schema Information
#
# Table name: plans
#
#  id                :integer          not null, primary key
#  name              :string(150)
#  monthly_premium   :integer
#  annual_deductible :integer
#  max_oop           :integer
#  created_at        :datetime
#  updated_at        :datetime
#  coinsurance       :integer
#

require 'spec_helper'

describe Plan do
  pending "add some examples to (or delete) #{__FILE__}"
end
