require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/faqs/show.html.erb" do
  include FaqsHelper
  before(:each) do
    assigns[:faq] = @faq = stub_model(Faq,
      :question => "value for question",
      :reponse => "value for reponse",
      :association_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ question/)
    response.should have_text(/value\ for\ reponse/)
    response.should have_text(/1/)
  end
end

