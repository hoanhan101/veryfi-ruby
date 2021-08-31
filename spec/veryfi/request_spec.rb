# frozen_string_literal: true

require "spec_helper"

RSpec.describe Veryfi::Request do
  include_context :with_veryfi_client

  context "when server responds with 400 error" do
    before do
      stub_request(:get, /\.*/).to_return(status: 400)
    end

    it "raises error" do
      expect { client.document.all }.to raise_error(Veryfi::Error::BadRequest)
    end
  end

  context "when server responds with 401 error" do
    before do
      stub_request(:get, /\.*/).to_return(status: 401)
    end

    it "raises error" do
      expect { client.document.all }.to raise_error(
        Veryfi::Error::UnauthorizedAccessToken,
        "Unauthorized Access Token"
      )
    end
  end

  context "when server responds with 405 error" do
    before do
      stub_request(:get, /\.*/).to_return(status: 405)
    end

    it "raises error" do
      expect { client.document.all }.to raise_error(Veryfi::Error::UnexpectedHTTPMethod)
    end
  end

  context "when server responds with 409 error" do
    before do
      stub_request(:get, /\.*/).to_return(status: 409)
    end

    it "raises error" do
      expect { client.document.all }.to raise_error(Veryfi::Error::AccessLimitReached)
    end
  end

  context "when server responds with 500 error" do
    before do
      stub_request(:get, /\.*/).to_return(status: 500)
    end

    it "raises error" do
      expect { client.document.all }.to raise_error(Veryfi::Error::InternalError)
    end
  end
end
