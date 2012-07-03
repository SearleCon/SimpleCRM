require 'spec_helper'

describe "tags/new" do
  before(:each) do
    assign(:tag, stub_model(Tag,
      :name => "MyString",
      :tagtype => "MyString",
      :tagcolor => "MyString",
      :userid => 1
    ).as_new_record)
  end

  it "renders new tag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tags_path, :method => "post" do
      assert_select "input#tag_name", :name => "tag[name]"
      assert_select "input#tag_tagtype", :name => "tag[tagtype]"
      assert_select "input#tag_tagcolor", :name => "tag[tagcolor]"
      assert_select "input#tag_userid", :name => "tag[userid]"
    end
  end
end
