class ProfilesController < ActionController::Base

  def plan_comparison
    # @profile = UsageProfile.find(params[:id])
    @plans = Plan.all

    gon.plans = Plan.all.to_a
    render layout: 'application'
  end
end