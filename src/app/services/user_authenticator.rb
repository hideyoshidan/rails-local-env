module UserAuthenticator
  # 以下static method
  extend self

  # request_headerを解析し、Userを取得
  def call request_headers
    @request_headers = request_headers
    begin
      payload, = TokenDecryptor.call(token)
      User.find(payload['email'])
    rescue StandardError
      nil
    end
  end

  private
    # tokenを取得
    def token
      @request_headers['Authorization'].split(' ').last
    end
end