require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ArticlesController do
  include AuthenticatedTestHelper
  fixtures :users

  def mock_article(stubs={})
    @mock_article ||= mock_model(Article, stubs)
  end
  
  describe "GET index" do
    it "assigns the articles of the month as @articles" do
      Article.stub!(:of_the_month).and_return([mock_article])
      get :index
      assigns[:articles].should == [mock_article]
    end
  end
  
  describe "GET articles_du_jour" do
    it "should assigns all the current day articles as @articles" do
      Article.should_receive(:du_jour).with("2009-07-30").and_return([mock_article])
      get :articles_du_jour, :day => "2009-07-30"
      assigns[:articles].should == [mock_article]
    end
  end
  
  describe "GET articles_du_mois" do
    
    before(:each) do
      @time = Date.today.to_time
    end
    
    it "should assigns all the current month articles as @articles" do
      Article.should_receive(:of_the_given_month).with(@time).and_return([mock_article])
      get :articles_du_mois, :day => @time
      assigns[:articles].should == [mock_article]
    end
  end

  describe "GET show" do
    before(:each) do
      @comment = mock_model(Comment)
      @proxy_comments = [@comment]
    end
    
    it "assigns the requested article as @article" do
      Article.stub!(:find).with("37").and_return(mock_article)
      mock_article.should_receive(:comments).and_return(@proxy_comments)
      @proxy_comments.should_receive(:last_five).and_return([@comment])
      get :show, :id => "37"
      assigns[:article].should equal(mock_article)
    end
  end

  describe "GET new" do
    
    before(:each) do
      login_as('quentin')
    end
    
    it "assigns a new article as @article" do
      Article.stub!(:new).and_return(mock_article)
      get :new
      assigns[:article].should equal(mock_article)
    end
  end

  describe "GET edit" do
    
    before(:each) do
      login_as('quentin')
    end
    
    it "assigns the requested article as @article" do
      Article.stub!(:find).with("37").and_return(mock_article)
      get :edit, :id => "37"
      assigns[:article].should equal(mock_article)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created article as @article" do
        Article.stub!(:new).with({'these' => 'params'}).and_return(mock_article(:save => true))
        mock_article.should_receive(:author=)
        post :create, :article => {:these => 'params'}
        assigns[:article].should equal(mock_article)
      end

      it "redirects to the created article" do
        Article.stub!(:new).and_return(mock_article(:save => true))
        mock_article.should_receive(:author=)
        post :create, :article => {}
        response.should redirect_to(article_url(mock_article))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved article as @article" do
        Article.stub!(:new).with({'these' => 'params'}).and_return(mock_article(:save => false))
        mock_article.should_receive(:author=)
        post :create, :article => {:these => 'params'}
        assigns[:article].should equal(mock_article)
      end

      it "re-renders the 'new' template" do
        Article.stub!(:new).and_return(mock_article(:save => false))
        mock_article.should_receive(:author=)
        post :create, :article => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested article" do
        Article.should_receive(:find).with("37").and_return(mock_article)
        mock_article.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :article => {:these => 'params'}
      end

      it "assigns the requested article as @article" do
        Article.stub!(:find).and_return(mock_article(:update_attributes => true))
        put :update, :id => "1"
        assigns[:article].should equal(mock_article)
      end

      it "redirects to the article" do
        Article.stub!(:find).and_return(mock_article(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(article_url(mock_article))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested article" do
        Article.should_receive(:find).with("37").and_return(mock_article)
        mock_article.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :article => {:these => 'params'}
      end

      it "assigns the article as @article" do
        Article.stub!(:find).and_return(mock_article(:update_attributes => false))
        put :update, :id => "1"
        assigns[:article].should equal(mock_article)
      end

      it "re-renders the 'edit' template" do
        Article.stub!(:find).and_return(mock_article(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    
    before(:each) do
      login_as('quentin')
    end
    
    it "destroys the requested article" do
      Article.should_receive(:find).with("37").and_return(mock_article)
      mock_article.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the articles list" do
      Article.stub!(:find).and_return(mock_article(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(articles_url)
    end
  end

end
