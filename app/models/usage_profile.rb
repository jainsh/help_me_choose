class UsageProfile < ActiveRecord::Base
  belongs_to :user
  has_many :service_usages

  enum gender: [:male, :female]
end
