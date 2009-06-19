require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/faqs/edit.html.erb" do
  include FaqsHelper
  
  before(:each) do
    assigns[:faq] = @faq = stub_model(Faq,
      :new_record? => false,
      :question => "value for question",
      :reponse => "value for reponse",
      :association_id => 1
    )
  end

  it "renders the edit faq form" do
    render
    
    response.should have_tag("form[action=#{faq_path(@faq)}][method=post]") do
      with_tag('input#faq_question[name=?]', "faq[question]")
      with_tag('textarea#faq_reponse[name=?]', "faq[reponse]")
      with_tag('input#faq_association_id[name=?]', "faq[association_id]")
    end
  end
end


