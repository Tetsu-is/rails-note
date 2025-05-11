module Api
  class AuthController < ApplicationController
    def authenticate
      auth_service = AuthenticationService.new
      auth_header = request.headers['Authorization']

      if auth_header&.start_with?('Basic ')
        credentials = auth_header.sub('Basic ', '')
        username, password = auth_service.decode_basic_auth(credentials)
        
        user = User.find_by(username: username)
        if user && auth_service.verify_password?(user.password_digest, password)
          head :ok
        else
          head :unauthorized
        end
      else
        head :unauthorized
      end
    end
  end
end 