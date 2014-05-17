# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first      :string(100)
#  last       :string(100)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
end
