require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe GalleriesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "galleries", :action => "index").should == "/galleries"
    end
  
    it "maps #new" do
      route_for(:controller => "galleries", :action => "new").should == "/galleries/new"
    end
  
    it "maps #show" do
      route_for(:controller => "galleries", :action => "show", :id => "1").should == "/galleries/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "galleries", :action => "edit", :id => "1").should == "/galleries/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "galleries", :action => "create").should == {:path => "/galleries", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "galleries", :action => "update", :id => "1").should == {:path =>"/galleries/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "galleries", :action => "destroy", :id => "1").should == {:path =>"/galleries/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/galleries").should == {:controller => "galleries", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/galleries/new").should == {:controller => "galleries", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/galleries").should == {:controller => "galleries", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/galleries/1").should == {:controller => "galleries", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/galleries/1/edit").should == {:controller => "galleries", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/galleries/1").should == {:controller => "galleries", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/galleries/1").should == {:controller => "galleries", :action => "destroy", :id => "1"}
    end
  end
end
