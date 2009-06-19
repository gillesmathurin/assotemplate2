require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe FaqsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "faqs", :action => "index").should == "/faqs"
    end
  
    it "maps #new" do
      route_for(:controller => "faqs", :action => "new").should == "/faqs/new"
    end
  
    it "maps #show" do
      route_for(:controller => "faqs", :action => "show", :id => "1").should == "/faqs/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "faqs", :action => "edit", :id => "1").should == "/faqs/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "faqs", :action => "create").should == {:path => "/faqs", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "faqs", :action => "update", :id => "1").should == {:path =>"/faqs/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "faqs", :action => "destroy", :id => "1").should == {:path =>"/faqs/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/faqs").should == {:controller => "faqs", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/faqs/new").should == {:controller => "faqs", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/faqs").should == {:controller => "faqs", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/faqs/1").should == {:controller => "faqs", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/faqs/1/edit").should == {:controller => "faqs", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/faqs/1").should == {:controller => "faqs", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/faqs/1").should == {:controller => "faqs", :action => "destroy", :id => "1"}
    end
  end
end
