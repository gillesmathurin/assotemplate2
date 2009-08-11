require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActivitesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "activites", :action => "index").should == "/activites"
    end

    it "maps #new" do
      route_for(:controller => "activites", :action => "new").should == "/activites/new"
    end

    it "maps #show" do
      route_for(:controller => "activites", :action => "show", :id => "1").should == "/activites/1"
    end

    it "maps #edit" do
      route_for(:controller => "activites", :action => "edit", :id => "1").should == "/activites/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "activites", :action => "create").should == {:path => "/activites", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "activites", :action => "update", :id => "1").should == {:path =>"/activites/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "activites", :action => "destroy", :id => "1").should == {:path =>"/activites/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/activites").should == {:controller => "activites", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/activites/new").should == {:controller => "activites", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/activites").should == {:controller => "activites", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/activites/1").should == {:controller => "activites", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/activites/1/edit").should == {:controller => "activites", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/activites/1").should == {:controller => "activites", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/activites/1").should == {:controller => "activites", :action => "destroy", :id => "1"}
    end
  end
end
