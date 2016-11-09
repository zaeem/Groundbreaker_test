class Account < ActiveRecord::Base
  
  has_many :account_roles
  has_many :categories
  has_many :user_roles

  def tc(val)
  	return false
  end

end
