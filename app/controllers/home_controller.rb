class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index

    if current_user
      if sessions[:tenent_id]
        Tenent.set_current_tenent session[:tenent_id]
      else
        Tenent.set_current_tenent current_user.tenents.first
      end
      @tenant = Tenant.current_tenant
      params[:tenant_id] = @tenant.id
    end

  end

end
