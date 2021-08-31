# frozen_string_literal: true

module Veryfi
  module Api
    class Document
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def all(params = {})
        request.get("/partner/documents/", params)
      end

      def get(id, params = {})
        request.get("/partner/documents/#{id}", params)
      end
    end
  end
end
