require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it "sets the post_date as now" do
    comment = Comment.create!(name: "commenter", description: "description")

    expect(comment.post_date).to be_between(Time.now - 30, Time.now + 30).inclusive
  end
end
