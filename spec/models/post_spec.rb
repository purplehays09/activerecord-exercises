
require 'spec_helper'

# A test class for https://github.com/rabid/activerecord-exercises/tree/master/blog_posts.
RSpec.describe Post do
  subject do
    {
      title: "Title",
      content: "Content"
    }
  end

  def create_post
    Post.create(title: 'Test Post', content: 'Test Post Body')
  end

  it "list posts" do
    Post.destroy_all
    post = create_post
    byebug

    expect(Post.count).to eq(1) 
  end
  
  it "creates a post on the backend" do
    Post.create({title:"test",content:"content"}) 
    record = Post.find_by(title:'test')
    expect(record.content).to eq('content')
  end
  
  it "updates a post" do
    Post.destroy_all
    Post.create({title:"test",content:"content"}) 
    record = Post.find_by(title:'test')
    record.update(content:'new content')
    post = Post.find_by(title:'test')
    
    expect(post.content).to eq('new content') 
    
  end
  
  it "deletes a post" do
    Post.destroy_all
    post = Post.create({title:"test",content:"content"}) 
    post.destroy
    expect(Post.count).to eq(0) 
  end
  
end
