class Manage::Settings::Acl2::AccountRolesController < ApplicationController
  
  def index
    @account_roles = current_account.account_roles
  end


  def new
    @account_role = current_account.account_roles.new
  end


  def create
    @account_role = current_account.account_roles.new(account_role_params)
    if @account_role.save
      flash[:notice] = 'Role created.'
      redirect_to manage_settings_acl2_account_roles_path
    else
      render :new
    end
  end


  def update
    @account_role = current_account.account_roles.find params[:id]
    @account_role.update_attributes account_role_params
    flash[:notice] = 'Role updated'
    redirect_to manage_settings_acl2_account_roles_path
  end


  def edit
    @account_role = current_account.account_roles.find params[:id]
  end


  def destroy
    @account_role = current_account.account_roles.find params[:id]
    current_account.account_roles.delete(@account_role)
    flash[:notice] = 'Role removed.'
    redirect_to manage_settings_acl2_account_roles_path
  end


  def rights
    @account_role = current_account.account_roles.find params[:id]
  end


  def update_rights
    @account_role = current_account.account_roles.find params[:id]


    params[:right_ids].try(:each) do |right_id, result|
      if result.to_s=='true'
        AccountRoleRight.find_or_create_by(right_id: right_id, account_role_id: params[:id])
      else
        AccountRoleRight.where(right_id: right_id, account_role_id: params[:id]).delete_all
      end
    end
    params[:special_role].try(:each) do |user_id, result|
       
      role = nil
      if result[:role].present?
        if ( result[:role].include?('ROLE_CONTENT') && result[:role].include?("ROLE_CACHE") ) || result[:role].include?('ROLE_ADMIN')
          role = 'ROLE_ADMIN'
        elsif result[:role].include? "ROLE_CACHE"
          role = 'ROLE_CACHE'
        elsif result[:role].include? 'ROLE_CONTENT'
          role = 'ROLE_CONTENT'
        end
      end

      if role.present?
        user_role = SpecialRole.find_or_initialize_by(user_id: user_id)
        user_role.role = role
        user_role.save
      else
        SpecialRole.where(user_id: user_id).delete_all
      end
    end


    flash[:notice] = 'Rights updated.'
    redirect_to manage_settings_acl2_account_roles_path
  end


  def users
    @account_role = current_account.account_roles.find params[:id]
  end


  def update_users
    @account_role = current_account.account_roles.find params[:id]


    params[:user_ids].each do |user_id, result|
      if result.to_s=='true'
        UserAccountRole.find_or_create_by(user_id: user_id, account_role_id: params[:id])
      else
        UserAccountRole.where(user_id: user_id, account_role_id: params[:id]).delete_all
      end
    end


    flash[:notice] = 'Users updated.'
    redirect_to manage_settings_acl2_account_roles_path
  end


  private
  def account_role_params
    params.require(:account_role).permit(:name, :description)
  end
end
