# == Schema Information
#
# Table name: usage_profiles
#
#  id            :integer          not null, primary key
#  zipcode       :string(10)
#  gender        :integer
#  date_of_birth :date
#  user_id       :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe UsageProfile do
  pending "add some examples to (or delete) #{__FILE__}"
end
