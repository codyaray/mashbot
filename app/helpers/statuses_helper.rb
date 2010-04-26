module StatusesHelper
  def campaign_statuses_path
    "/campaigns/#{@campaign.id}/statuses"
  end
  
  def campaign_status_path status
    "#{campaign_statuses_path}/#{status.id}"
  end
  
  def edit_campaign_status_path status
    campaign_status_path(status) + '/edit'
  end

  def destroy_campaign_status_path status
    campaign_status_path(status) + '/destroy'
  end

  def campaign_status_url status
    "statuses/#{status.id}"
  end

  alias :status_url :campaign_status_url
  alias :statuses_path :campaign_statuses_path 
  alias :status_path :campaign_status_path
  alias :edit_status_path :edit_campaign_status_path
  alias :destroy_status_path :destroy_campaign_status_path
end
