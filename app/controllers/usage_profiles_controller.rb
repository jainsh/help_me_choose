class UsageProfilesController < ApplicationController
  def new
    @usage_profile = UsageProfile.new
    ServiceCost.find_each do |sc|
      @usage_profile.service_usages.build(:service_cost => sc)
    end
  end
end
