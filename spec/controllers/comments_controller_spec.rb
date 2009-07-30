require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CommentsController do

  def mock_comment(stubs={})
    @mock_comment ||= mock_model(Comment, stubs)
  end
  
  def mock_article(stubs={})
    @mock_article ||= mock_model(Article, stubs)
  end
  
  before(:all) do
    Article.should_receive(:find).with("1").and_return(@mock_article)
  end
  
  describe "GET index" do  
    it "assigns all comments as @comments" do
      @mock_article.should_receive(:comments).and_return([mock_comment])
      get :index, :article_id => "1"
      assigns[:comments].should == [mock_comment]
    end
  end

  describe "GET show" do
    
    before(:each) do
      @prox_comments = mock('comments')
    end
        
    it "assigns the requested comment as @comment" do
      @mock_article.should_receive(:comments).and_return(@prox_comments)
      @prox_comments.should_receive(:find).with("37").and_return(mock_comment)
      get :show, :article_id => "1", :id => "37"
      assigns[:comment].should == (mock_comment)
    end
  end

  describe "GET new" do
    
    before(:each) do
      
    end
    
    it "assigns a new comment as @comment" do
      @mock_article.should_receive(:comments).and_return(@prox_comments)
      @prox_comments.should_receive(:build).and_return(mock_comment)
      get :new, :article_id => "1"
      assigns[:comment].should == (mock_comment)
    end
  end

  describe "GET edit" do
    it "assigns the requested comment as @comment" do
      @mock_article.should_receive(:comments).and_return(@prox_comments)
      @prox_comments.should_receive(:find).with("37").and_return(mock_comment)
      get :show, :article_id => "1", :id => "37"
      assigns[:comment].should equal(mock_comment)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created comment as @comment" do
        @mock_article.should_receive(:comments).and_return(@prox_comments)
        @prox_comments.should_receive(:build).with({'these' => 'params'}).and_return(mock_comment(:save => true))
        post :create, :comment => {:these => 'params'}, :article_id => "1"
        assigns[:comment].should equal(mock_comment)
      end

      it "redirects to the created comment" do
        @mock_article.should_receive(:comments).and_return(@prox_comments)
        @prox_comments.should_receive(:build).with({}).and_return(mock_comment(:save => true))
        post :create, :comment => {}, :article_id => "1"
        response.should redirect_to(comment_url(mock_comment))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        @mock_article.should_receive(:comments).and_return(@prox_comments)
        @prox_comments.should_receive(:build).with({}).and_return(mock_comment(:save => false))
        post :create, :comment => {:these => 'params'}, :article_id => "1"
        assigns[:comment].should equal(mock_comment)
      end

      it "re-renders the 'new' template" do
        @mock_article.should_receive(:comments).and_return(@prox_comments)
        @prox_comments.should_receive(:build).with({}).and_return(mock_comment(:save => false))
        post :create, :comment => {}, :article_id => "1"
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested comment" do
        @mock_article.should_receive(:comments).and_return(@prox_comments)
        @prox_comments.should_receive(:find).with("37").and_return(mock_comment)
        mock_comment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :comment => {:these => 'params'}, :article_id => "1"
      end

      it "redirects to the comment" do
        @mock_article.should_receive(:comments).and_return(@prox_comments)
        @prox_comments.should_receive(:find).with("37").and_return(mock_comment(:update_attributes => true))
        put :update, :id => "37", :article_id =>"1"
        response.should redirect_to(comment_url(mock_comment))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested comment" do
        @mock_article.should_receive(:comments).and_return(@prox_comments)
        @prox_comments.should_receive(:find).with("37").and_return(mock_comment)
        mock_comment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :comment => {:these => 'params'}, :article_id => "1"
      end

      it "re-renders the 'edit' template" do
        @mock_article.should_receive(:comments).and_return(@prox_comments)
        @prox_comments.should_receive(:find).with("37").and_return(mock_comment(:update_attributes => false))
        put :update, :id => "37", :article_id =>"1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      Comment.should_receive(:find).with("37").and_return(mock_comment)
      mock_comment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the comments list" do
      Comment.stub!(:find).and_return(mock_comment(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(comments_url)
    end
  end

end
