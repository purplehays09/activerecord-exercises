require 'rails_helper'

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

  it "attaches part to page" do
    page = create_page
    part = Part.new(title: 'New Page Part')
    page.parts << part

    expect(part.page).to eq(page) 
  end

  it "remove part from page" do
    page = create_page
    part = page.parts.create(title: 'Deleted page page')
    page.parts.destroy(part)

    expect(page.parts).to be_empty
    
  end

  it "collect page content" do
    page = create_page
    page.parts.create(title: 'Test A', content: 'Content for Test A')
    page.parts.create(title: 'Test B', content: 'Content for Test B')

    expect(page.parts.pluck(:content)).to eq(
      ['Content for Test A', 'Content for Test B']
    ) 
  end

  it "get content for part" do
    page = create_page
    page.parts.create(title: 'Test A', content: 'Content for Test A')

    expect(page.parts.find_by(title: 'Test A').content).to eq('Content for Test A') 
  end
  
  
  
  
end