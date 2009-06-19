require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AssociationsController do

  def mock_association(stubs={})
    @mock_association ||= mock_model(Association, stubs)
  end
  
  describe "GET index" do
    it "assigns all associations as @associations" do
      Association.stub!(:find).with(:all).and_return([mock_association])
      get :index
      assigns[:associations].should == [mock_association]
    end
  end

  describe "GET show" do
    it "assigns the requested association as @association" do
      Association.stub!(:find).with("37").and_return(mock_association)
      get :show, :id => "37"
      assigns[:association].should equal(mock_association)
    end
  end

  describe "GET new" do
    it "assigns a new association as @association" do
      Association.stub!(:new).and_return(mock_association)
      get :new
      assigns[:association].should equal(mock_association)
    end
  end

  describe "GET edit" do
    it "assigns the requested association as @association" do
      Association.stub!(:find).with("37").and_return(mock_association)
      get :edit, :id => "37"
      assigns[:association].should equal(mock_association)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created association as @association" do
        Association.stub!(:new).with({'these' => 'params'}).and_return(mock_association(:save => true))
        post :create, :association => {:these => 'params'}
        assigns[:association].should equal(mock_association)
      end

      it "redirects to the created association" do
        Association.stub!(:new).and_return(mock_association(:save => true))
        post :create, :association => {}
        response.should redirect_to(association_url(mock_association))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved association as @association" do
        Association.stub!(:new).with({'these' => 'params'}).and_return(mock_association(:save => false))
        post :create, :association => {:these => 'params'}
        assigns[:association].should equal(mock_association)
      end

      it "re-renders the 'new' template" do
        Association.stub!(:new).and_return(mock_association(:save => false))
        post :create, :association => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested association" do
        Association.should_receive(:find).with("37").and_return(mock_association)
        mock_association.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :association => {:these => 'params'}
      end

      it "assigns the requested association as @association" do
        Association.stub!(:find).and_return(mock_association(:update_attributes => true))
        put :update, :id => "1"
        assigns[:association].should equal(mock_association)
      end

      it "redirects to the association" do
        Association.stub!(:find).and_return(mock_association(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(association_url(mock_association))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested association" do
        Association.should_receive(:find).with("37").and_return(mock_association)
        mock_association.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :association => {:these => 'params'}
      end

      it "assigns the association as @association" do
        Association.stub!(:find).and_return(mock_association(:update_attributes => false))
        put :update, :id => "1"
        assigns[:association].should equal(mock_association)
      end

      it "re-renders the 'edit' template" do
        Association.stub!(:find).and_return(mock_association(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested association" do
      Association.should_receive(:find).with("37").and_return(mock_association)
      mock_association.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the associations list" do
      Association.stub!(:find).and_return(mock_association(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(associations_url)
    end
  end

end
