# frozen_string_literal: true

module Veryfi
  module Api
    class Document
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def all(params = {})
        response = request.get("/partner/documents/", params)

        Array(response)
      end

      def get(id, params = {})
        request.get("/partner/documents/#{id}", params)
      end
    end
  end
end
