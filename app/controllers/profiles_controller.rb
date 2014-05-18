class ProfilesController < ActionController::Base

  def plan_comparison
    # @profile = UsageProfile.find(params[:id])
    # @plans = Plan.all

    gon.plans = "Wowsie wow"
    render layout: 'application'
  end
end