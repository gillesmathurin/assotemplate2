require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/activites/show.html.erb" do
  include ActivitesHelper
  before(:each) do
    assigns[:activite] = @activite = stub_model(Activite,
      :nom => "value for nom",
      :description => "value for description",
      :tarif => "value for tarif",
      :public => "value for public",
      :lieu => "value for lieu",
      :horaire => "value for horaire"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ nom/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/value\ for\ tarif/)
    response.should have_text(/value\ for\ public/)
    response.should have_text(/value\ for\ lieu/)
    response.should have_text(/value\ for\ horaire/)
  end
end
