# frozen_string_literal: true

module Veryfi
  autoload :VERSION, "veryfi/version"
  autoload :Signature, "veryfi/signature"
  autoload :Request, "veryfi/request"

  module Api
    autoload :Document, "veryfi/api/document"
  end

  autoload :Client, "veryfi/client"
end
