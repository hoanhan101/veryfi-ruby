# frozen_string_literal: true

require "Base64"

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

      def process(params)
        params = params.transform_keys(&:to_sym)

        file_content = File.read(params[:file_path])
        file_name = File.basename(params[:file_path], ".*")
        file_data = Base64.encode64(file_content).gsub("\n", "")

        payload = params.reject { |k| k == :file_path }.merge(
          file_name: file_name,
          file_data: file_data
        )

        request.post("/partner/documents/", payload)
      end

      def process_url(params)
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
