require 'rails_helper'

RSpec.describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      expect(Comment.create()).to be_a Comment
    end
  end

  it 'belongs to an article' do
    comment = Comment.create!()
    expect(comment).to respond_to :article
  end
end
