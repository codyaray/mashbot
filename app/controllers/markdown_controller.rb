class MarkdownController < ApplicationController
  
  def preview
    renderer = RDiscount.new(params[:t])
    render :text => renderer.to_html
  end
  
end
