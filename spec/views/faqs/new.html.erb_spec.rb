require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/faqs/new.html.erb" do
  include FaqsHelper
  
  before(:each) do
    assigns[:faq] = stub_model(Faq,
      :new_record? => true,
      :question => "value for question",
      :reponse => "value for reponse",
      :association_id => 1
    )
  end

  it "renders new faq form" do
    render
    
    response.should have_tag("form[action=?][method=post]", faqs_path) do
      with_tag("input#faq_question[name=?]", "faq[question]")
      with_tag("textarea#faq_reponse[name=?]", "faq[reponse]")
      with_tag("input#faq_association_id[name=?]", "faq[association_id]")
    end
  end
end


