# frozen_string_literal: true

require 'jwt'

# rubocop:enable
module JwtWebToken
  extend ActiveSupport::Concern
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
  def self.jwt_encode(payload, exp: (Time.now + 60.hours))
    exp_payload = { id: payload, exp: exp.to_i }
    JWT.encode(exp_payload, SECRET_KEY)
  end

  def self.jwt_decode(token)
    JWT.decode(token, SECRET_KEY, true)[0]
  end
end
