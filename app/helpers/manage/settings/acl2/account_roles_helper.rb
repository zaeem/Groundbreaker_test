module Manage::Settings::Acl2::AccountRolesHelper
	def checked_user_role(user, area)
	  special_role = user.special_role
	  special_role.present? && (special_role.role == 'ROLE_ADMIN'  || special_role.role ==  area) ? area : false
	end
end
