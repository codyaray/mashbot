require 'spec_helper'

describe "/statuses/show.html.erb" do
  include StatusesHelper
  before(:each) do
    assigns[:status] = @status = stub_model(Status,
      :campaign_id => 1,
      :message => "value for message",
      :creator_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ message/)
    response.should have_text(/1/)
  end
end
