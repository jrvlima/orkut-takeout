require "rails_helper"

describe SignInController do

  it "should call first social media controller" do
    get :export, export: "social_network_1"
    expect(response.body).to match(/social_network_1/)
  end

  it "should call second social media controller" do
    get :export, export: "social_network_2"
    expect(response.body).to match(/social_network_2/)
  end

  it "should call third social media controller" do
    get :export, export: "social_network_3"
    expect(response.body).to match(/social_network_3/)
  end

  it "should call raise and exception" do
    expect { get :export }.to raise_error(/RecordNotFound/)
  end

end