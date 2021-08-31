# frozen_string_literal: true

require "spec_helper"

RSpec.describe "Document API" do
  include_context :with_veryfi_client

  let(:documents_fixture) { File.read("spec/fixtures/documents.json") }
  let(:documents) { JSON.parse(documents_fixture) }

  it { expect(client.api_url).to eq "https://api.veryfi.com/api/v7" }

  describe "document.all" do
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

  describe "document.create(id, params)" do
    before do
      stub_request(:post, "https://api.veryfi.com/api/v7/partner/documents/").to_return(
        body: documents[0].to_json
      )
    end

    let(:document_params) do
      {
        "file_name": "invoice.png",
        "file_url": "https://raw.githubusercontent.com/veryfi/veryfi-python/master/tests/assets/receipt_public.jpg",
        "file_urls": [
          "https://raw.githubusercontent.com/veryfi/veryfi-python/master/tests/assets/receipt_public.jpg"
        ],
        "auto_delete": 1,
        "boost_mode": 1,
        "async": 1,
        "external_id": "123456789",
        "max_pages_to_process": 10,
        "tags": [
          "tag1"
        ],
        "categories": [
          "Advertising & Marketing",
          "Automotive"
        ]
      }
    end

    it "can fetch document by id" do
      response = client.document.create(document_params)

      expect(response["id"]).to eq(38_947_300)
    end
  end

  describe "document.get(id)" do
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

  describe "document.update(id, params)" do
    before do
      stub_request(:put, "https://api.veryfi.com/api/v7/partner/documents/38947300").to_return(
        body: documents[0].merge(discount: 0.9).to_json
      )
    end

    it "can update document" do
      response = client.document.update(38_947_300, discount: 0.9)

      expect(response["id"]).to eq(38_947_300)
      expect(response["discount"]).to eq(0.9)
    end
  end

  describe "document.delete(id)" do
    before do
      stub_request(:delete, "https://api.veryfi.com/api/v7/partner/documents/38947300").to_return(
        body: { status: "ok", message: "Document has been deleted" }.to_json
      )
    end

    it "can fetch document by id" do
      response = client.document.delete(38_947_300)

      expect(response["message"]).to eq("Document has been deleted")
    end
  end
end
