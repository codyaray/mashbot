class StatusesController < ApplicationController
  before_filter :require_user
  include StatusesHelper
  # GET /statuses
  # GET /statuses.xml
  def index
    @statuses = Status.all
    @campaign = Campaign.find params[:campaign_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @statuses }
    end
  end

  # GET /statuses/1
  # GET /statuses/1.xml
  def show
    @status = Status.find(params[:id])
    @campaign = Campaign.find params[:campaign_id]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @status }
    end
  end

  # GET /statuses/new
  # GET /statuses/new.xml
  def new
    @status = Status.new
    @campaign = Campaign.find params[:campaign_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @status }
    end
  end

  # GET /statuses/1/edit
  def edit
    @status = Status.find(params[:id])
    @campaign = Campaign.find params[:campaign_id]
  end

  # POST /statuses
  # POST /statuses.xml
  def create
    @status = Status.new(params[:status])
    @campaign = Campaign.find params[:campaign_id]
    @status.creator = current_user
    @status.campaign = @campaign
    @status.go_live = "#{params[:go_live_date]} #{params[:go_live_time]}"
    respond_to do |format|
      if @status.save
        flash[:notice] = 'Status was successfully created.'
        format.html { redirect_to(@status) }
        format.xml  { render :xml => @status, :status => :created, :location => @status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statuses/1
  # PUT /statuses/1.xml
  def update
    @status = Status.find(params[:id])
    @campaign = Campaign.find(params[:campaign_id])
    @status.creator = current_user
    @status.campaign = @campaign
    @status.go_live = "#{params[:go_live_date]} #{params[:go_live_time]}"

    respond_to do |format|
      if @status.update_attributes(params[:status])
        flash[:notice] = 'Status was successfully updated.'
breakpoint
        format.html { redirect_to(status_path(@status)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.xml
  def destroy
    @status = Status.find(params[:id])
    @campaign = Campaign.find(params[:campaign_id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(@status) }
      format.xml  { head :ok }
    end
  end
end
