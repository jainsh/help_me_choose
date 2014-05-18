class ProfilesController < ActionController::Base

  def plan_comparison
    # @profile = UsageProfile.find(params[:id])
    @plans = Plan.all

    gon.plans = Plan.all.to_a
    gon.premiums = @plans.map(&:annual_premium)
    render layout: 'application'
  end
end