require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GalleriesController do
  include AuthenticatedTestHelper
  fixtures :users

  def mock_gallery(stubs={})
    @mock_gallery ||= mock_model(Gallery, stubs)
  end
  
  def mock_membre(stubs={})
    @mock_membre ||= mock_model(User, stubs)
  end
  
  describe "GET index" do    
    
    before(:each) do
      User.should_receive(:find).with("2").and_return(mock_membre)
      @prox_galleries = mock('galleries')
    end
    
    it "assigns the last four member's galleries as @galleries" do
      mock_membre.should_receive(:galleries).and_return(@prox_galleries)
      @prox_galleries.should_receive(:last_four).and_return([mock_gallery])
      get :index, :user_id => "2"
      assigns[:galleries].should == [mock_gallery]
    end
  end

  describe "GET show" do
    
    describe "within a member context" do
      
      before(:each) do
        User.should_receive(:find).with("2").and_return(mock_membre)
        @prox_galleries = mock('galleries')
      end
      
      it "assgins the requested member gallery as @gallery" do
        mock_membre.should_receive(:galleries).and_return(mock_gallery)
        mock_gallery.should_receive(:find).with("37").and_return(mock_gallery)
        get :show, :user_id => "2", :id => "37"
        assigns[:gallery].should equal(mock_gallery)
      end
    end
    
    describe "outside a member context" do
      it "assigns the requested gallery as @gallery" do
        Gallery.stub!(:find).with("37").and_return(mock_gallery)
        get :show, :id => "37"
        assigns[:gallery].should equal(mock_gallery)
      end
    end
  end

  describe "GET new" do
    before(:each) do
      User.should_receive(:find).with("2").and_return(mock_membre)
      @prox_galleries = mock('galleries')
    end
    
    it "assigns a new gallery as @gallery" do
      mock_membre.should_receive(:galleries).and_return(@prox_galleries)
      @prox_galleries.should_receive(:build).and_return(mock_gallery)
      get :new, :user_id => "2"
      assigns[:gallery].should equal(mock_gallery)
    end
  end

  describe "GET edit" do
    
    before(:each) do
      User.should_receive(:find).with("2").and_return(mock_membre)
      @prox_galleries = mock('galleries')
    end
    
    it "assigns the requested gallery as @gallery" do
      mock_membre.should_receive(:galleries).and_return(@prox_galleries)
      @prox_galleries.should_receive(:find).with("37").and_return(mock_gallery)
      get :edit, :id => "37", :user_id => "2"
      assigns[:gallery].should equal(mock_gallery)
    end
  end

  describe "POST create" do
    
    before(:each) do
      User.should_receive(:find).with("2").and_return(mock_membre)
      @prox_galleries = mock('galleries')
    end
    
    describe "with valid params" do
      it "assigns a newly created gallery as @gallery" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:build).with({'these' => 'params'}).and_return(mock_gallery(:save => true))
        post :create, :gallery => {:these => 'params'}, :user_id => "2"
        assigns[:gallery].should equal(mock_gallery)
      end

      it "redirects to the created gallery" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:build).with({'these' => 'params'}).and_return(mock_gallery(:save => true))
        post :create, :gallery => {:these => 'params'}, :user_id => "2"
        response.should redirect_to(user_gallery_url(mock_membre, mock_gallery))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved gallery as @gallery" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:build).with({'these' => 'params'}).and_return(mock_gallery(:save => false))
        post :create, :gallery => {:these => 'params'}, :user_id => "2"
        assigns[:gallery].should equal(mock_gallery)
      end

      it "re-renders the 'new' template" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:build).with({'these' => 'params'}).and_return(mock_gallery(:save => false))
        post :create, :gallery => {:these => 'params'}, :user_id => "2"
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    before(:each) do
      User.should_receive(:find).with("2").and_return(mock_membre)
      @prox_galleries = mock('galleries')
    end
    
    describe "with valid params" do
      it "updates the requested gallery" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:find).with("37").and_return(mock_gallery)
        mock_gallery.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user_id => "2", :gallery => {:these => 'params'}
      end

      it "assigns the requested gallery as @gallery" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:find).and_return(mock_gallery(:update_attributes => true))
        put :update, :id => "1", :user_id => "2"
        assigns[:gallery].should equal(mock_gallery)
      end

      it "redirects to the gallery" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:find).and_return(mock_gallery(:update_attributes => true))
        put :update, :id => "1", :user_id => "2"
        response.should redirect_to(gallery_url(mock_gallery))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested gallery" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:find).with("37").and_return(mock_gallery)
        mock_gallery.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :gallery => {:these => 'params'}, :user_id => "2"
      end

      it "assigns the gallery as @gallery" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:find).and_return(mock_gallery(:update_attributes => false))
        put :update, :id => "1", :user_id => "2"
        assigns[:gallery].should equal(mock_gallery)
      end

      it "re-renders the 'edit' template" do
        mock_membre.should_receive(:galleries).and_return(@prox_galleries)
        @prox_galleries.should_receive(:find).and_return(mock_gallery(:update_attributes => false))
        put :update, :id => "1", :user_id => "2"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    
    before(:each) do
      User.should_receive(:find).with("2").and_return(mock_membre)
      @prox_galleries = mock('galleries')
    end
    
    it "destroys the requested gallery" do
      Gallery.should_receive(:find).with("37").and_return(mock_gallery)
      mock_gallery.should_receive(:destroy)
      delete :destroy, :id => "37", :user_id => "2"
    end
  
    it "redirects to the galleries list" do
      Gallery.stub!(:find).and_return(mock_gallery(:destroy => true))
      delete :destroy, :id => "1", :user_id => "2"
      response.should redirect_to(user_galleries_url(mock_membre))
    end
  end

end
