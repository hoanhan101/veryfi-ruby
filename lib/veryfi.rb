# frozen_string_literal: true

module Veryfi
  autoload :VERSION, "veryfi/version"
  autoload :Signature, "veryfi/signature"
  autoload :Request, "veryfi/request"

  module Api
    autoload :Document, "veryfi/api/document"
    autoload :LineItem, "veryfi/api/line_item"
    autoload :Tag, "veryfi/api/tag"
    autoload :DocumentTag, "veryfi/api/document_tag"
  end

  autoload :Client, "veryfi/client"
end
