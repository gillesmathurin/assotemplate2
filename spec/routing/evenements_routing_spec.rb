require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EvenementsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "evenements", :action => "index").should == "/evenements"
    end
  
    it "maps #new" do
      route_for(:controller => "evenements", :action => "new").should == "/evenements/new"
    end
  
    it "maps #show" do
      route_for(:controller => "evenements", :action => "show", :id => "1").should == "/evenements/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "evenements", :action => "edit", :id => "1").should == "/evenements/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "evenements", :action => "create").should == {:path => "/evenements", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "evenements", :action => "update", :id => "1").should == {:path =>"/evenements/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "evenements", :action => "destroy", :id => "1").should == {:path =>"/evenements/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/evenements").should == {:controller => "evenements", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/evenements/new").should == {:controller => "evenements", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/evenements").should == {:controller => "evenements", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/evenements/1").should == {:controller => "evenements", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/evenements/1/edit").should == {:controller => "evenements", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/evenements/1").should == {:controller => "evenements", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/evenements/1").should == {:controller => "evenements", :action => "destroy", :id => "1"}
    end
  end
end
