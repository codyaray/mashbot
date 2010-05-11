module CampaignsHelper
  def get_index
    if request.referer.match /post/
      return 1
    elsif request.referer.match /photo/ 
      return 2
    else
      return 0
    end
  end
end
