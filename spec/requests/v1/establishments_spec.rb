require 'rails_helper'

RSpec.describe "V1::Establishments", type: :request do

  describe "Routes" , :type => :routing do
    it "routes post to create" do
      expect(post: "v1/establishments").to route_to(controller: "v1/establishments", action: "create")
    end
  end

  describe "POST /create" do
    before do
      post v1_establishments_path, params: establishment_params
      json = JSON.parse(response.body).deep_symbolize_keys
    end

    it "responds with a json response" do
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end

    it 'returns http status ok' do
      expect(response).to have_http_status(:ok)
    end

    it "creates an establishment with name Test Establishment" do
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:data][:attributes][:name]).to eq "Test Establishment"
    end

    it "creates an address associated to the establishment" do
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:data][:relationships][:address][:establishment_id]).to eq json[:data][:attributes][:id]
    end

    it "creates an user associated to the establishment" do
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:data][:relationships][:users][:data][0][:establishment_id]).to eq json[:data][:attributes][:id]
    end
  end


  private

  def establishment_params
    {
      "establishment": {
          "name": "Test Establishment",
          "registration_number": "TEST1",
          "address_attributes": {
              "address1": "Booth no.92",
              "zip": "sector 23",
              "city": "test",
              "state": "Alaska",
              "country": "United States"
          }
      },
      format: :json
    }
  end

end
