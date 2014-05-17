class ServiceCostsController < ApplicationController
  def index
    @service_costs = ServiceCost.all
  end
end
