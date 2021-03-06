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

class UsageProfile < ActiveRecord::Base
  belongs_to :user
  has_many :service_usages

  accepts_nested_attributes_for :service_usages, :allow_destroy => true

  enum gender: [:male, :female] unless instance_methods.include? :gender

  def cost_for_plan(plan)
    Calculator.calculate_for_usage_profile(self, plan)
  end
end
