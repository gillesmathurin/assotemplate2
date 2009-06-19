require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EvenementsController do

  def mock_evenement(stubs={})
    @mock_evenement ||= mock_model(Evenement, stubs)
  end
  
  describe "GET index" do
    it "assigns all evenements as @evenements" do
      Evenement.stub!(:find).with(:all).and_return([mock_evenement])
      get :index
      assigns[:evenements].should == [mock_evenement]
    end
  end

  describe "GET show" do
    it "assigns the requested evenement as @evenement" do
      Evenement.stub!(:find).with("37").and_return(mock_evenement)
      get :show, :id => "37"
      assigns[:evenement].should equal(mock_evenement)
    end
  end

  describe "GET new" do
    it "assigns a new evenement as @evenement" do
      Evenement.stub!(:new).and_return(mock_evenement)
      get :new
      assigns[:evenement].should equal(mock_evenement)
    end
  end

  describe "GET edit" do
    it "assigns the requested evenement as @evenement" do
      Evenement.stub!(:find).with("37").and_return(mock_evenement)
      get :edit, :id => "37"
      assigns[:evenement].should equal(mock_evenement)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created evenement as @evenement" do
        Evenement.stub!(:new).with({'these' => 'params'}).and_return(mock_evenement(:save => true))
        post :create, :evenement => {:these => 'params'}
        assigns[:evenement].should equal(mock_evenement)
      end

      it "redirects to the created evenement" do
        Evenement.stub!(:new).and_return(mock_evenement(:save => true))
        post :create, :evenement => {}
        response.should redirect_to(evenement_url(mock_evenement))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved evenement as @evenement" do
        Evenement.stub!(:new).with({'these' => 'params'}).and_return(mock_evenement(:save => false))
        post :create, :evenement => {:these => 'params'}
        assigns[:evenement].should equal(mock_evenement)
      end

      it "re-renders the 'new' template" do
        Evenement.stub!(:new).and_return(mock_evenement(:save => false))
        post :create, :evenement => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested evenement" do
        Evenement.should_receive(:find).with("37").and_return(mock_evenement)
        mock_evenement.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :evenement => {:these => 'params'}
      end

      it "assigns the requested evenement as @evenement" do
        Evenement.stub!(:find).and_return(mock_evenement(:update_attributes => true))
        put :update, :id => "1"
        assigns[:evenement].should equal(mock_evenement)
      end

      it "redirects to the evenement" do
        Evenement.stub!(:find).and_return(mock_evenement(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(evenement_url(mock_evenement))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested evenement" do
        Evenement.should_receive(:find).with("37").and_return(mock_evenement)
        mock_evenement.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :evenement => {:these => 'params'}
      end

      it "assigns the evenement as @evenement" do
        Evenement.stub!(:find).and_return(mock_evenement(:update_attributes => false))
        put :update, :id => "1"
        assigns[:evenement].should equal(mock_evenement)
      end

      it "re-renders the 'edit' template" do
        Evenement.stub!(:find).and_return(mock_evenement(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested evenement" do
      Evenement.should_receive(:find).with("37").and_return(mock_evenement)
      mock_evenement.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the evenements list" do
      Evenement.stub!(:find).and_return(mock_evenement(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(evenements_url)
    end
  end

end
