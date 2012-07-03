require 'spec_helper'

describe "people/edit" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
      :firstname => "MyString",
      :surname => "MyString",
      :idnumber => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path(@person), :method => "post" do
      assert_select "input#person_firstname", :name => "person[firstname]"
      assert_select "input#person_surname", :name => "person[surname]"
      assert_select "input#person_idnumber", :name => "person[idnumber]"
      assert_select "input#person_email", :name => "person[email]"
    end
  end
end
