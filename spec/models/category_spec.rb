require 'rails_helper'

RSpec.describe Category do
  # let(:post) do
  #   {
  #     title:'title',
  #     content:'content',
  #   }
  # end
  # let(:category) do
  #   Category.create({name: 'test name'})
  # end

  def create_category(attrs = {})
    Category.create!({ name: 'Test Category' }.merge(attrs))
  end

  def create_post(attrs = {})
    default_attrs = { title: 'Test Post', content: 'Test Post Content' }
    post = default_attrs.merge(attrs)
    Post.create!(default_attrs.merge(attrs))
  end

  it "creates a post with a category" do
    category = create_category
    post = create_post(category: category)
    expect(post.category.name).to eq('Test Category') 
  end

  it "lists categories" do
    Category.destroy_all
    categories = (1..5).map do |num|
      create_category(name: "Category #{num}")
    end
    expect(categories.count).to eq(5) 
  end
  it "lists posts for category" do
    category = create_category
    posts = (1..5).map do |num|
      create_post(title: "Post#{num}", category:category)
    end
    expect(category.posts.order(title: :asc).pluck(:title)).to eq(posts.map(&:title))
  end

  it "removes post from category" do
    category = create_category
    post = create_post(category: category)
    category.posts.delete(post)

    expect(category.posts.count).to be < 1
    expect(post.title).to eq('Test Post') 
  end
  
    
end
