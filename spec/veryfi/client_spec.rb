# frozen_string_literal: true

require "spec_helper"

RSpec.describe Veryfi::Client do
  subject(:client) do
    described_class.new(
      client_id: "fBvJLm1zCJ8Doxf94mMrpbrkDp8nr",
      client_secret: "FDPXbxHTrSKPAVOJGoB0doUWhJmmbcm3ajFTwtclagdlygkp3yuIMJjirFbO1oKGC4nr",
      username: "john_doe",
      api_key: "35a7120b190e40df477a170149c63977"
    )
  end

  let(:documents_fixture) { File.read("spec/fixtures/documents.json") }

  its(:api_url) { is_expected.to eq "https://api.veryfi.com/api/v7" }

  describe "get_documents" do
    before do
      stub_request(:get, "https://api.veryfi.com/api/v7/partner/documents/").to_return(
        body: documents_fixture
      )
    end

    it "can fetch documents" do
      response = client.document.all

      expect(response[0]["id"]).to eq(38_947_300)
    end
  end

  describe "get_document(id)" do
    let(:documents) { JSON.parse(documents_fixture) }

    before do
      stub_request(:get, "https://api.veryfi.com/api/v7/partner/documents/38947300").to_return(
        body: documents[0].to_json
      )
    end

    it "can fetch document by id" do
      response = client.document.get(38_947_300)

      expect(response["id"]).to eq(38_947_300)
    end
  end
end
