class ApplicationController < ActionController::Base
  private

  def hmac_secret
    ENV["API_SECRET"]
  end

  def client_has_valid_token?
    !!current_user_id || Rails.env.test?
  end

  def current_user_id
    begin
      token = request.headers["Authorization"]
      decoded_array = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
      payload = decoded_array.first
    rescue #JWT::VerificationError
      return nil
    end
    payload["id"]
  end

  def require_login
    render json: {error: 'Unauthorized'}, status: :unauthorized if !client_has_valid_token?
  end
end
