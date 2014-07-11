module DoubleDog
  module AdminSession
    def admin_session?(params)
      user = params[:user]
      if user.admin?
        return params
      else
        return failure(:not_admin)
      end
    end
  end
end
  

