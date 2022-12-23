require "jwt"
module JwtWebToken
  extend ActiveSupport::Concern
  SECRET_KEY =Rails.application.secrets.secret_key_base.to_s
  def self.jwt_encode(payload, exp:(Time.now + 30.seconds))
    exp_payload = { id: payload, exp: exp.to_i }
    JWT.encode(exp_payload, SECRET_KEY)[0]
  end
  def self.jwt_decode(token)
    JWT.decode(token, nil, false)
  end
end
