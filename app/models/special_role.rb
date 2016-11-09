class SpecialRole < ActiveRecord::Base
  belongs_to :user

  validates :role, inclusion: { in: %w(ROLE_CONTENT ROLE_CACHE ROLE_ADMIN),
    message: "%{value} is not a valid." }


end
