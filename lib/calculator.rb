class Calculator

  def self.calculate_annual_premium(plan)
    plan.monthly_premium * 12
  end

  def self.calculate_for_usage_profile(profile, plan)
    aggregate = 0

    profile.service_usages.each do |usage|
      if usage.usage_count > 0
        aggregate += calculate_for_service(plan: plan,
                                           usage: usage,
                                           aggregate: aggregate)
      end
    end

    aggregate
  end

  private

  def self.calculate_for_service(args)
    plan = args[:plan]
    usage = args[:usage]
    benefit = usage.benefit_for(plan)
    aggregate = args[:aggregate]

    service = usage.service_cost

    moop = plan.maximum_oop

    return 0 if maximum_oop_met?(moop, aggregate)

    coinsurance_cost = 0
    if benefit.coinsurance? and not deductible_met?(plan.annual_deductible, aggregate)
      differential = evaluate_differential(deductible, aggregate)
      assessible_cost = ((usage.usage_count * service.cost * plan.coinsurance).to_f / 100.to_f ).floor
      coinsurance_cost =  applicable_cost(differential, assessible_cost)
    end

    copay_cost = 0
    if benefit.copay > 0
      differential = evaluate_differential(moop, (aggregate + coinsurance_cost))
      copay_cost =  applicable_cost(differential, benefit.copay)
    end

    coinsurance_cost + copay_cost
  end

  def self.evaluate_differential(maximum, aggregate)
    maximum - aggregate
  end

  def self.applicable_cost(differential, charge)
    differential > charge ? charge : (charge - differential)
  end

  def self.maximum_oop_met?(moop, aggregate)
    moop <= aggregate
  end

  def self.deductible_met?(deductible, aggregate)
    deductible <= aggregate
  end
end