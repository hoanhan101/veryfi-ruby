# frozen_string_literal: true

require "date"
require "faraday"
require "json"

module Veryfi
  class Request
    attr_reader :client_id, :client_secret, :username, :api_key, :base_url, :api_version, :timeout

    def initialize(
      client_id,
      client_secret,
      username,
      api_key,
      base_url,
      api_version,
      timeout
    )
      @client_id = client_id
      @client_secret = client_secret
      @username = username
      @api_key = api_key
      @base_url = base_url
      @api_version = api_version
      @timeout = timeout
    end

    def get(path, params)
      url = [api_url, path].join
      headers = generate_headers(params)
      response = Faraday.get(url, params, headers)
      JSON.parse(response.body)
    end

    def api_url
      @_api_url ||= [base_url, api_version].join
    end

    private

    def generate_headers(params = {})
      return default_headers if client_secret.nil?

      timestamp = DateTime.now.strftime("%Q")
      signature = generate_signature(params, timestamp)

      default_headers.merge(
        "X-Veryfi-Request-Timestamp": timestamp,
        "X-Veryfi-Request-Signature": signature
      )
    end

    def default_headers(has_files: false)
      {
        "User-Agent": "Ruby Veryfi-Ruby/0.1.0",
        "Accept": "application/json",
        "Content-Type": has_files ? "application/x-www-form-urlencoded" : "application/json",
        "Client-Id": client_id,
        "Authorization": "apikey #{username}:#{api_key}"
      }
    end

    def generate_signature(params, timestamp)
      Veryfi::Signature.new(client_secret, params, timestamp).to_base64
    end
  end
end
