class User < ActiveRecord::Base
	has_many :user_roles
	has_one :special_role
end
