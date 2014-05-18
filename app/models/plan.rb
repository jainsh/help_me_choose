# == Schema Information
#
# Table name: plans
#
#  id                :integer          not null, primary key
#  name              :string(150)
#  monthly_premium   :integer
#  annual_deductible :integer
#  max_oop           :integer
#  created_at        :datetime
#  updated_at        :datetime
#  coinsurance       :integer
#  code              :string(255)
#

class Plan < ActiveRecord::Base
  has_many :plan_benefits

  def annual_premium
    Calculator.calculate_annual_premium(self)
  end
end
