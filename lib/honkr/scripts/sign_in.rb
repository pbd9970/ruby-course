module Honkr
  class SignIn

    def self.run(params)
      user = Honkr.db.get_user_by_username(params[:username])
      result = OpenStruct.new(:success? => user.has_password?(params[:password]))
      if result.success?
        result.session_id = Honkr.db.create_session({user_id: user.id})
      else
        result.error = :invalid_password 
      end
      result
    end
  end
end
