require 'spec_helper'

describe "tags/edit" do
  before(:each) do
    @tag = assign(:tag, stub_model(Tag,
      :name => "MyString",
      :tagtype => "MyString",
      :tagcolor => "MyString",
      :userid => 1
    ))
  end

  it "renders the edit tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tags_path(@tag), :method => "post" do
      assert_select "input#tag_name", :name => "tag[name]"
      assert_select "input#tag_tagtype", :name => "tag[tagtype]"
      assert_select "input#tag_tagcolor", :name => "tag[tagcolor]"
      assert_select "input#tag_userid", :name => "tag[userid]"
    end
  end
end
