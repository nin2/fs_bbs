require 'spec_helper'

describe "country_areas/index" do
  before(:each) do
    assign(:country_areas, [
      stub_model(CountryArea,
        :name => "Name"
      ),
      stub_model(CountryArea,
        :name => "Name"
      )
    ])
  end

  it "renders a list of country_areas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
