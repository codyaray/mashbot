require 'spec_helper'

describe "/statuses/index.html.erb" do
  include StatusesHelper

  before(:each) do
    assigns[:statuses] = [
      stub_model(Status,
        :campaign_id => 1,
        :message => "value for message",
        :creator_id => 1
      ),
      stub_model(Status,
        :campaign_id => 1,
        :message => "value for message",
        :creator_id => 1
      )
    ]
  end

  it "renders a list of statuses" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for message".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
