class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :authenticate_admin!
  before_action :admin_access_denied

  def admin_access_denied
    redirect_to "/admins/sign_in" unless current_admin
  end

end
