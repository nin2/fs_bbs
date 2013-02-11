require 'spec_helper'

describe "country_areas/new" do
  before(:each) do
    assign(:country_area, stub_model(CountryArea,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new country_area form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => country_areas_path, :method => "post" do
      assert_select "input#country_area_name", :name => "country_area[name]"
    end
  end
end
