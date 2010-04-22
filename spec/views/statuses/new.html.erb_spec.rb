require 'spec_helper'

describe "/statuses/new.html.erb" do
  include StatusesHelper

  before(:each) do
    assigns[:status] = stub_model(Status,
      :new_record? => true,
      :campaign_id => 1,
      :message => "value for message",
      :creator_id => 1
    )
  end

  it "renders new status form" do
    render

    response.should have_tag("form[action=?][method=post]", statuses_path) do
      with_tag("input#status_campaign_id[name=?]", "status[campaign_id]")
      with_tag("input#status_message[name=?]", "status[message]")
      with_tag("input#status_creator_id[name=?]", "status[creator_id]")
    end
  end
end
