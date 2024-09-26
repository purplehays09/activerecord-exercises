# frozen_string_literal: true

##
# This test file is for https://github.com/rabid/activerecord-exercises/tree/master/blog_posts.
# It is intended to test the acceptance criteria for the exercise.
#
# YOU WILL NEED TO CHANGE THIS FILE YOURSELF IN MOST CASES FOR
# THESE TESTS TO PASS.
#
# A note on testing frameworks:
#
# In most cases we recommend testing with RSpec, as this testing library
# provides a number of convenient helpers and a nice consistent way of
# organising tests.
#
# To tests these exercises, we are testing with Test::Unit (via Minitest).
# Test::Unit is built into a default Rails install, so no additional gems
# need to be added to get started. There's no strong differences between
# the two in terms of readability. If you wish, you can install and configure
# `gem "rspec-rails"` in your own application, and rewrite these tests in the
# RSpec style.

require 'rails_helper'

# A test class for https://github.com/rabid/activerecord-exercises/tree/master/blog_posts.
RSpec.describe Post do
  subject do
    {
      title: "Title",
      content: "Content"
    }
  end

  it "list posts" do
    Post.destroy_all
    Post.create(subject)
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
