module JwtService
  # Jwt Authenticate
  module UserAuthenticator
    extend self
    
    # JwtService::UserAuthenticator.authenticateで認証をする
    def authenticate request_headers
      @request_headers = request_headers
      begin
        payload, = JwtDecryotor::decrypt_token get_token
        User.find(payload['id'])
      rescue StandardError
        nil
      end
    end

    private
      def get_token
        @request_headers['Authorization'].split(' ').last
      end
  end

  # Jwt Tokenを作成
  module JwtTokenProvider
    extend self

    # JwtService::JwtTokenProvider.create_new_tokenでtokenを作成する
    def create_new_token payload
      issue_token payload
    end

    private
      # token払い出し
      def issue_token(payload)
        JWT.encode(payload, Rails.application.credentials.secret_key_base)
      end
  end

  # Jwt Tokenを検証
  module JwtDecryotor
    extend self

    def decrypt_token token
      decrypt token
    end

    private
      # tokenをdecryptして検証をする
      # credentials.yml.enc を使ってdecode
      def decrypt token
        JWT.decode(token, Rails.application.credentials.secret_key_base)
      rescue StandardError
        raise InvalidTokenError
      end
  end
end

class InvalidTokenError < StandardError; end