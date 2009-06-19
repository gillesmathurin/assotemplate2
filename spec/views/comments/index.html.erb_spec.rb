require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/index.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comments] = [
      stub_model(Comment,
        :auteur => "value for auteur",
        :article_id => 1,
        :body => "value for body"
      ),
      stub_model(Comment,
        :auteur => "value for auteur",
        :article_id => 1,
        :body => "value for body"
      )
    ]
  end

  it "renders a list of comments" do
    render
    response.should have_tag("tr>td", "value for auteur".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end

