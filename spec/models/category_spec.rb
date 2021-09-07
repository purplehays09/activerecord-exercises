require 'rails_helper'

RSpec.describe Category do
  let(:post) do
    {
      title:'title',
      content:'content',
    }
  end
  let(:category) do
    {
      name:'name',

    }
  end
  it "creates a post with a category" do
    post.merge(category: Category.create(category))”
    Post.create(post)
    expect(category.name).to eq(Post.category.name) 
  end
  
end
