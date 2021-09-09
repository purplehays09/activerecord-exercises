require 'spec_helper'

RSpec.describe Friendship do
  def create_person(attrs = {})
    Person.create!(attrs)
  end

  def create_friendship(person1, person2)
    Friendship.create!(source: person1, destination: person2)
  end

  it "becomes friends" do
    person1 = create_person(name: 'Person A')
    person2 = create_person(name: 'Person B')

    friendship = create_friendship(person1, person2)
    expect(freindship).to exist
  end

end
