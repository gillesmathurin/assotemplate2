require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/comments/edit.html.erb" do
  include CommentsHelper
  
  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false,
      :auteur => "value for auteur",
      :article_id => 1,
      :body => "value for body"
    )
  end

  it "renders the edit comment form" do
    render
    
    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('input#comment_auteur[name=?]', "comment[auteur]")
      with_tag('input#comment_article_id[name=?]', "comment[article_id]")
      with_tag('textarea#comment_body[name=?]', "comment[body]")
    end
  end
end


