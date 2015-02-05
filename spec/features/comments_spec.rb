require 'rails_helper'

RSpec.feature 'Managing comments' do
  scenario 'List all comments for a given article' do
    article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    Comment.create!(body: 'This is clickbait.', article: article)
    Comment.create!(body: 'This is clickbait.', article: article)
    Comment.create!(body: 'This is clickbait.', article: article)

    visit "/articles/#{article.id}/comments"

    expect(page.find('h1')).to have_content "Comments for \"#{article.title}\""
    expect(page).to have_selector 'li.comment', count: 3
  end

  scenario 'List first ten comments for a given article on the article show page' do
    article = Article.create!(title: 'One Stupid Trick', body: "You won't believe what they did next...")
    Comment.create!(body: 'This is clickbait.', article: article)
    Comment.create!(body: 'This is clickbait.', article: article)
    Comment.create!(body: 'This is clickbait.', article: article)

    visit "/articles/#{article.id}"

    expect(page.find('article>h1')).to have_content article.title
    expect(page.find('aside>h1')).to have_content 'Comments'
    expect(page.find('aside')).to have_selector 'li.comment', count: 3
  end
end
