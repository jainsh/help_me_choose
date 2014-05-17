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

  enum gender: [:male, :female] unless instance_methods.include? :gender
end
