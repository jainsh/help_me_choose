class UsageProfilesController < ApplicationController
  def new
    @usage_profile = UsageProfile.new
    ServiceCost.find_each do |sc|
      @usage_profile.service_usages.build(:service_cost => sc)
    end
  end

  def create
    @usage_profile = UsageProfile.new(usage_profile_params)
    if @usage_profile.save
      redirect_to service_costs_path
    else
      render :new
    end
  end

  private

  def usage_profile_params
    params.require(:usage_profile).permit(:gender, :zipcode, :date_of_birth, service_usages_attributes: [ :usage_count ])
  end

end
