require 'spec_helper'

describe StatusesController do

  def mock_status(stubs={})
    @mock_status ||= mock_model(Status, stubs)
  end

  describe "GET index" do
    it "assigns all statuses as @statuses" do
      Status.stub(:find).with(:all).and_return([mock_status])
      get :index
      assigns[:statuses].should == [mock_status]
    end
  end

  describe "GET show" do
    it "assigns the requested status as @status" do
      Status.stub(:find).with("37").and_return(mock_status)
      get :show, :id => "37"
      assigns[:status].should equal(mock_status)
    end
  end

  describe "GET new" do
    it "assigns a new status as @status" do
      Status.stub(:new).and_return(mock_status)
      get :new
      assigns[:status].should equal(mock_status)
    end
  end

  describe "GET edit" do
    it "assigns the requested status as @status" do
      Status.stub(:find).with("37").and_return(mock_status)
      get :edit, :id => "37"
      assigns[:status].should equal(mock_status)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created status as @status" do
        Status.stub(:new).with({'these' => 'params'}).and_return(mock_status(:save => true))
        post :create, :status => {:these => 'params'}
        assigns[:status].should equal(mock_status)
      end

      it "redirects to the created status" do
        Status.stub(:new).and_return(mock_status(:save => true))
        post :create, :status => {}
        response.should redirect_to(status_url(mock_status))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved status as @status" do
        Status.stub(:new).with({'these' => 'params'}).and_return(mock_status(:save => false))
        post :create, :status => {:these => 'params'}
        assigns[:status].should equal(mock_status)
      end

      it "re-renders the 'new' template" do
        Status.stub(:new).and_return(mock_status(:save => false))
        post :create, :status => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested status" do
        Status.should_receive(:find).with("37").and_return(mock_status)
        mock_status.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :status => {:these => 'params'}
      end

      it "assigns the requested status as @status" do
        Status.stub(:find).and_return(mock_status(:update_attributes => true))
        put :update, :id => "1"
        assigns[:status].should equal(mock_status)
      end

      it "redirects to the status" do
        Status.stub(:find).and_return(mock_status(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(status_url(mock_status))
      end
    end

    describe "with invalid params" do
      it "updates the requested status" do
        Status.should_receive(:find).with("37").and_return(mock_status)
        mock_status.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :status => {:these => 'params'}
      end

      it "assigns the status as @status" do
        Status.stub(:find).and_return(mock_status(:update_attributes => false))
        put :update, :id => "1"
        assigns[:status].should equal(mock_status)
      end

      it "re-renders the 'edit' template" do
        Status.stub(:find).and_return(mock_status(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested status" do
      Status.should_receive(:find).with("37").and_return(mock_status)
      mock_status.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the statuses list" do
      Status.stub(:find).and_return(mock_status(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(statuses_url)
    end
  end

end
