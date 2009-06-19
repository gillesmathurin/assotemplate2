require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AssociationsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "associations", :action => "index").should == "/associations"
    end
  
    it "maps #new" do
      route_for(:controller => "associations", :action => "new").should == "/associations/new"
    end
  
    it "maps #show" do
      route_for(:controller => "associations", :action => "show", :id => "1").should == "/associations/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "associations", :action => "edit", :id => "1").should == "/associations/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "associations", :action => "create").should == {:path => "/associations", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "associations", :action => "update", :id => "1").should == {:path =>"/associations/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "associations", :action => "destroy", :id => "1").should == {:path =>"/associations/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/associations").should == {:controller => "associations", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/associations/new").should == {:controller => "associations", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/associations").should == {:controller => "associations", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/associations/1").should == {:controller => "associations", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/associations/1/edit").should == {:controller => "associations", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/associations/1").should == {:controller => "associations", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/associations/1").should == {:controller => "associations", :action => "destroy", :id => "1"}
    end
  end
end
