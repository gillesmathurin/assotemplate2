require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActivitesController do

  def mock_activite(stubs={})
    @mock_activite ||= mock_model(Activite, stubs)
  end

  describe "GET index" do
    it "assigns all activites as @activites" do
      Activite.stub!(:find).with(:all).and_return([mock_activite])
      get :index
      assigns[:activites].should == [mock_activite]
    end
  end

  describe "GET show" do
    it "assigns the requested activite as @activite" do
      Activite.stub!(:find).with("37").and_return(mock_activite)
      get :show, :id => "37"
      assigns[:activite].should equal(mock_activite)
    end
  end

  describe "GET new" do
    it "assigns a new activite as @activite" do
      Activite.stub!(:new).and_return(mock_activite)
      get :new
      assigns[:activite].should equal(mock_activite)
    end
  end

  describe "GET edit" do
    it "assigns the requested activite as @activite" do
      Activite.stub!(:find).with("37").and_return(mock_activite)
      get :edit, :id => "37"
      assigns[:activite].should equal(mock_activite)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created activite as @activite" do
        Activite.stub!(:new).with({'these' => 'params'}).and_return(mock_activite(:save => true))
        post :create, :activite => {:these => 'params'}
        assigns[:activite].should equal(mock_activite)
      end

      it "redirects to the created activite" do
        Activite.stub!(:new).and_return(mock_activite(:save => true))
        post :create, :activite => {}
        response.should redirect_to(activite_url(mock_activite))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved activite as @activite" do
        Activite.stub!(:new).with({'these' => 'params'}).and_return(mock_activite(:save => false))
        post :create, :activite => {:these => 'params'}
        assigns[:activite].should equal(mock_activite)
      end

      it "re-renders the 'new' template" do
        Activite.stub!(:new).and_return(mock_activite(:save => false))
        post :create, :activite => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested activite" do
        Activite.should_receive(:find).with("37").and_return(mock_activite)
        mock_activite.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :activite => {:these => 'params'}
      end

      it "assigns the requested activite as @activite" do
        Activite.stub!(:find).and_return(mock_activite(:update_attributes => true))
        put :update, :id => "1"
        assigns[:activite].should equal(mock_activite)
      end

      it "redirects to the activite" do
        Activite.stub!(:find).and_return(mock_activite(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(activite_url(mock_activite))
      end
    end

    describe "with invalid params" do
      it "updates the requested activite" do
        Activite.should_receive(:find).with("37").and_return(mock_activite)
        mock_activite.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :activite => {:these => 'params'}
      end

      it "assigns the activite as @activite" do
        Activite.stub!(:find).and_return(mock_activite(:update_attributes => false))
        put :update, :id => "1"
        assigns[:activite].should equal(mock_activite)
      end

      it "re-renders the 'edit' template" do
        Activite.stub!(:find).and_return(mock_activite(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested activite" do
      Activite.should_receive(:find).with("37").and_return(mock_activite)
      mock_activite.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the activites list" do
      Activite.stub!(:find).and_return(mock_activite(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(activites_url)
    end
  end

end
