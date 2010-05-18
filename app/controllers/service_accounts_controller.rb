class ServiceAccountsController < ApplicationController
  before_filter :require_user
  
  # GET /service_accounts
  # GET /service_accounts.xml
  def index
    @service_accounts = ServiceAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_accounts }
    end
  end

  # GET /service_accounts/1
  # GET /service_accounts/1.xml
  def show
    @service_account = ServiceAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_account }
    end
  end

  # GET /service_accounts/new
  # GET /service_accounts/new.xml
  def new
    @service_account = ServiceAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_account }
    end
  end

  # GET /service_accounts/1/edit
  def edit
    @service_account = ServiceAccount.find(params[:id])
  end

  # POST /service_accounts
  # POST /service_accounts.xml
  def create
    @service_account = ServiceAccount.new(params[:service_account])
    @service_account.user = current_user

    respond_to do |format|
      if @service_account.save
        flash[:notice] = 'ServiceAccount was successfully created.'
        format.html { redirect_to(@service_account) }
        format.xml  { render :xml => @service_account, :status => :created, :location => @service_account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_accounts/1
  # PUT /service_accounts/1.xml
  def update
    @service_account = ServiceAccount.find(params[:id])

    respond_to do |format|
      if @service_account.update_attributes(params[:service_account])
        flash[:notice] = 'ServiceAccount was successfully updated.'
        format.html { redirect_to(@service_account) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_accounts/1
  # DELETE /service_accounts/1.xml
  def destroy
    @service_account = ServiceAccount.find(params[:id])
    @service_account.destroy

    respond_to do |format|
      format.html { redirect_to(service_accounts_url) }
      format.xml  { head :ok }
    end
  end
end
