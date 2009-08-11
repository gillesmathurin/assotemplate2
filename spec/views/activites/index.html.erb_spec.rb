require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/activites/index.html.erb" do
  include ActivitesHelper

  before(:each) do
    assigns[:activites] = [
      stub_model(Activite,
        :nom => "value for nom",
        :description => "value for description",
        :tarif => "value for tarif",
        :public => "value for public",
        :lieu => "value for lieu",
        :horaire => "value for horaire"
      ),
      stub_model(Activite,
        :nom => "value for nom",
        :description => "value for description",
        :tarif => "value for tarif",
        :public => "value for public",
        :lieu => "value for lieu",
        :horaire => "value for horaire"
      )
    ]
  end

  it "renders a list of activites" do
    render
    response.should have_tag("tr>td", "value for nom".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", "value for tarif".to_s, 2)
    response.should have_tag("tr>td", "value for public".to_s, 2)
    response.should have_tag("tr>td", "value for lieu".to_s, 2)
    response.should have_tag("tr>td", "value for horaire".to_s, 2)
  end
end
