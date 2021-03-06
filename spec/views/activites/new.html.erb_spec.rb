require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/activites/new.html.erb" do
  include ActivitesHelper

  before(:each) do
    assigns[:activite] = stub_model(Activite,
      :new_record? => true,
      :nom => "value for nom",
      :description => "value for description",
      :tarif => "value for tarif",
      :public => "value for public",
      :lieu => "value for lieu",
      :horaire => "value for horaire"
    )
  end

  it "renders new activite form" do
    render

    response.should have_tag("form[action=?][method=post]", activites_path) do
      with_tag("input#activite_nom[name=?]", "activite[nom]")
      with_tag("textarea#activite_description[name=?]", "activite[description]")
      with_tag("input#activite_tarif[name=?]", "activite[tarif]")
      with_tag("input#activite_public[name=?]", "activite[public]")
      with_tag("input#activite_lieu[name=?]", "activite[lieu]")
      with_tag("input#activite_horaire[name=?]", "activite[horaire]")
    end
  end
end
