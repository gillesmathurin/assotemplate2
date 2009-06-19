require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/show.html.erb" do
  include CommentsHelper
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :auteur => "value for auteur",
      :article_id => 1,
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ auteur/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ body/)
  end
end

