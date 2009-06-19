require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/faqs/index.html.erb" do
  include FaqsHelper
  
  before(:each) do
    assigns[:faqs] = [
      stub_model(Faq,
        :question => "value for question",
        :reponse => "value for reponse",
        :association_id => 1
      ),
      stub_model(Faq,
        :question => "value for question",
        :reponse => "value for reponse",
        :association_id => 1
      )
    ]
  end

  it "renders a list of faqs" do
    render
    response.should have_tag("tr>td", "value for question".to_s, 2)
    response.should have_tag("tr>td", "value for reponse".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end

