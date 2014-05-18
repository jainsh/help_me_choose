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
      redirect_to plan_comparison_path(@usage_profile)
    else
      render :new
    end
  end

  def edit
    @usage_profile = UsageProfile.find(params[:id])
    render :new
  end

  def update
    @usage_profile = UsageProfile.find(params[:id])
    if @usage_profile.update_attributes(usage_profile_params)
      redirect_to plan_comparison_path(@usage_profile)
    else
      render :new
    end
  end

  private

  def usage_profile_params
    params.require(:usage_profile).permit(:id, :gender, :zipcode, :date_of_birth, service_usages_attributes: [ :id, :service_cost_id, :usage_count ])
  end

end
