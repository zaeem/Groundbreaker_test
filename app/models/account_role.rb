class AccountRole < ActiveRecord::Base

	belongs_to :account

	has_many :account_role_rights
	has_many :rights, through: :account_role_rights

end
