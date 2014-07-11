module DoubleDog
  class CreateAccount < TransactionScript
    include AdminSession

    def run(params)
      return failure(:not_admin) unless admin_session?(params[:session_id])
      return failure(:invalid_username) unless User::valid_username?(params[:username])
      return failure(:invalid_password) unless User::valid_password?(params[:password])

      user = DoubleDog.db.create_user(:username => params[:username], :password => params[:password])
      return success(:user => user)
    end
  end
end
#    def run(params)
#      result = validate_session(params[:session_id])
#      if result[:success?]
#        user = result[:user]
#        result = admin_session?(result)
#        
#      return failure(:invalid_username) unless User::valid_username?(params[:username])
#      return failure(:invalid_password) unless User::valid_password?(params[:password])
#
#      new_user = DoubleDog.db.create_user(:username => params[:username], :password => params[:password])
#      return success(:user => user)
#    end
#  end
#end
