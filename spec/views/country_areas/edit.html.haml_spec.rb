require 'spec_helper'

describe "country_areas/edit" do
  before(:each) do
    @country_area = assign(:country_area, stub_model(CountryArea,
      :name => "MyString"
    ))
  end

  it "renders the edit country_area form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => country_areas_path(@country_area), :method => "post" do
      assert_select "input#country_area_name", :name => "country_area[name]"
    end
  end
end
