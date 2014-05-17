class Calculate

  # service_cost = cost
  # frequency = freq
  # plan benefit coinsurance = coinsurance
  # plan benefit copay = copay
  # annual deductible = deductible
  # max oop = moop
  # total premiums = premium
  # cost total = tcost
  # copay assessed unless moop met
  # coinsurance assessed unless deductible met

  def maximum_oop_met?(moop, aggregate)
    moop <= aggregate
  end

  def deductible_met?(deductible, aggregate)
    deductible <= aggregate
  end

  def cost_to_apply(args)
    usage = args[:usage]
    service = usage.service_cost
    benefit = service.plan_benefit
    plan = benefit.plan

    aggregate = args[:aggregate]
    moop = plan.maxiumum_oop

    return 0 if maximum_oop_met?(moop, aggregate)

    deductible = plan.annual_deductible
    if deductible_met?(deductible, aggregate)
      coinsurance_cost = 0
    else
      # TODO: maybe implement some rounding logic - is this needed?
      assessible_cost = (usage.usage_count * service.cost * plan.coinsurance) / 100

      differential = evaluate_differential(deductible, aggregate)
      if differential > 0
        coinsurance_cost =  applicable_cost(differential, assessible_cost)
      else
        coinsurance_cost = 0
      end
    end

    # TODO: only calculate if plan_benefit has copay
    differential = evaluate_differential(moop, (aggregate + coinsurance_cost))
    if differential > 0
      copay_cost =  applicable_cost(differential, benefit.copay)
    else
      copay_cost = 0
    end

    coinsurance_cost + copay_cost
  end

  def evaluate_differential(maximum, aggregate)
    differential = maximum - aggregate
    differential > 0 ? differential : 0
  end

  def applicable_cost(differential, charge)
    differential > charge ? charge : (charge - differential)
  end
end