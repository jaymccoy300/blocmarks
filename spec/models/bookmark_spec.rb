require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:user) { User.create!(username: "random", email: "random@gmail.com", password: "password") }
  let(:topic) { Topic.create!(title: "Random", user: user) }
  let(:bookmark) { Bookmark.create!(url: "www.random.com", topic: topic) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "has url and topic" do
      expect(bookmark).to have_attributes(url: "www.random.com", topic: topic)
    end
  end
end
