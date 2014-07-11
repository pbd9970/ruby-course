module DoubleDog
  class TransactionScript

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
