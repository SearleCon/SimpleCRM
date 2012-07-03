require 'spec_helper'

describe "people/new" do
  before(:each) do
    assign(:person, stub_model(Person,
      :firstname => "MyString",
      :surname => "MyString",
      :idnumber => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new person form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => people_path, :method => "post" do
      assert_select "input#person_firstname", :name => "person[firstname]"
      assert_select "input#person_surname", :name => "person[surname]"
      assert_select "input#person_idnumber", :name => "person[idnumber]"
      assert_select "input#person_email", :name => "person[email]"
    end
  end
end
