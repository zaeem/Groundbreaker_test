class AccountRoleRight < ActiveRecord::Base

	belongs_to :account_role
    belongs_to :right

end
