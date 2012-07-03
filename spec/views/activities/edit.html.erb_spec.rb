require 'spec_helper'

describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
      :shortname => "MyString",
      :description => "MyText",
      :active => false,
      :userid => 1
    ))
  end

  it "renders the edit activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => activities_path(@activity), :method => "post" do
      assert_select "input#activity_shortname", :name => "activity[shortname]"
      assert_select "textarea#activity_description", :name => "activity[description]"
      assert_select "input#activity_active", :name => "activity[active]"
      assert_select "input#activity_userid", :name => "activity[userid]"
    end
  end
end
