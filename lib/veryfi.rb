# frozen_string_literal: true

module Veryfi
  autoload :VERSION, "veryfi/version"
  autoload :Signature, "veryfi/signature"
  autoload :Request, "veryfi/request"

  module Api
    autoload :Document, "veryfi/api/document"
    autoload :LineItem, "veryfi/api/line_item"
  end

  autoload :Client, "veryfi/client"
end
