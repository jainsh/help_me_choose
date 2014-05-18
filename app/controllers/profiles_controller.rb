class ProfilesController < ActionController::Base

  def plan_usage
    @profile = UsageProfile.find(params[:id])
    @plan = Plan.find(params[:id])
    @premium = Calculator.calculate_annual_premium(@plan)
    @expenditures = Calculator.calculate_for_usage_profile(@profile, @plan)
  end
end