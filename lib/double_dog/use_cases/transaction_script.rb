module DoubleDog
  class TransactionScript

    def run(params, kwargs={})
      result = validate_session(params[:session_id])
      if result[:success?]
        user = result[:user]
        if kwargs[:admin_required?]
          result = admin_session?(result)
          return result if !result[:success?]
        end
        
      return failure(:invalid_username) unless User::valid_username?(params[:username])
      return failure(:invalid_password) unless User::valid_password?(params[:password])

      new_user = DoubleDog.db.create_user(:username => params[:username], :password => params[:password])
      return success(:user => user)
    end
    end

    def validate_session(params)
      session_id = params[:session_id]

      return failure(:session_id_required) if !session_id

      user = DoubleDog.db.get_user_by_session_id(session_id)
      if !user
        failure(:invalid_session)
      else
        success(:user => user)
      end
    end

    private

    def failure(error_name)
      return :success? => false, :error => error_name
    end

    def success(data)
      return data.merge(:success? => true)
    end
  end
end
