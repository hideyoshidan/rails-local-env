class ApplicationController < ActionController::API
  # 例外処理を継承
  class AuthenticationError < StandardError; end

  # Validationエラー時、400
  rescue_from ActiveRecord::RecordInvalid, with: :render_422

  # AuthenticationError時、not_authenticatedをcall
  rescue_from AuthenticationError, with: :not_authenticated

  # current_userがnilだったらException
  def authenticate
    raise AuthenticationError unless current_user
  end

  # 現在のUserをJWTか取得
  def current_user
    @current_user ||= JwtService::UserAuthenticator.authenticate(request.headers)
  end

  # https://26gram.com/private-protected-in-ruby
  # private : 
  #   - クラス外から呼び出しできない
  #   - 同じインスタンス内で、関数形式で呼び出せる（この場合は、rescue_from）
  # protected
  #   - クラスの外からは呼び出せない
  #   - 同じインスタンス内 OR 他のインスタンスでも同じクラスやサブクラスのメソッドで呼び出せる
  # public :
  #  - どこからでも呼び出せる
  private
    def not_authenticated
      render json: { error: { messages: ['please login'] } }, status: :unauthorized
    end

    # 参考になった記事
    # https://tech.timee.co.jp/entry/2020/08/11/182724
    def render_422 e
      render json: { error: { messages: e.record.errors.messages.as_json } }, status: :unauthorized
    end
end
