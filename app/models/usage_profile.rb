class UsageProfile < ActiveRecord::Base
  belongs_to :user

  enum gender: [:male, :female]
end
