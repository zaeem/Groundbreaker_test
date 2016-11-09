class CreateSpecialRoles < ActiveRecord::Migration
  def change
    create_table :special_roles do |t|
      t.references :user, index: true
      t.string :role

      t.timestamps
    end
  end
end
