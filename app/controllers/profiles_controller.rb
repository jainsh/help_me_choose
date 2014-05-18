class ProfilesController < ActionController::Base

  def plan_comparison
    @profile = UsageProfile.find(params[:id])
    @plans = Plan.all
    gon.plans = @plans.to_a
    gon.premiums = @plans.map(&:annual_premium)
    gon.cost_totals = @plans.map do |plan|
      @profile.cost_for_plan(plan)
    end
    render layout: 'application'
  end
end