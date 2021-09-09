require 'spec_helper'

RSpec.describe Page do 

  def create_page(attrs = {})
    default_attrs = { title: 'Home' }
    Page.create!(default_attrs.merge!(attrs))
  end

  it "creates page with parts" do
    page = create_page
    page.parts.create(title: 'Featured Content One')
    page.parts.create(title: 'Featured Content Two')
    page.parts.create(title: 'Featured Content Three')

    expect(page.parts.count).to eq(3) 
  end
  
end