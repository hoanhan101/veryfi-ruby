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

        response.is_a?(Hash) ? [response] : response
      end

      def create(params)
        request.post("/partner/documents/", params)
      end

      def get(id, params = {})
        request.get("/partner/documents/#{id}", params)
      end

      def update(id, params)
        request.put("/partner/documents/#{id}", params)
      end

      def delete(id)
        request.delete("/partner/documents/#{id}")
      end
    end
  end
end
