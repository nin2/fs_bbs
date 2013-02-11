require 'spec_helper'

describe "country_areas/show" do
  before(:each) do
    @country_area = assign(:country_area, stub_model(CountryArea,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
