class AddDummyData < ActiveRecord::Migration
  def change
  	account = Account.create!(name: 'account 1')
  	user = User.create!(email: 'test1@test.com')
  	user = User.create!(email: 'test@2test.com')
  	account_role = account.account_roles.create!

  end
end
