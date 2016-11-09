class Right < ActiveRecord::Base

	has_many :account_role_rights
	has_many :account_role, through: :account_role_rights

end
