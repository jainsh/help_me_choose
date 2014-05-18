class ProfilesController < ActionController::Base

  def plan_comparison
    @profile = UsageProfile.find(params[:id])
    @plans = Plan.all
    gon.plans = @plans.to_a
    gon.premiums = @plans.map(&:annual_premium)
    gon.max_oops = {}
    gon.deductibles = {}

    gon.cost_totals = @plans.map do |plan|
      gon.max_oops[plan.name] = plan.max_oop
      gon.deductibles[plan.name] = plan.annual_deductible
      @profile.cost_for_plan(plan)
    end
    render layout: 'application'
  end
end