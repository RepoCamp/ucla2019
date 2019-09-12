require 'rails_helper'

RSpec.describe 'Display an Image', type: :system do
  let(:title)      { ['Journey to Skull Island'] }
  let(:creator)    { ['Quest, Jane'] }
  let(:keyword)    { ['Pirates', 'Adventure'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let(:user)       { 'test@example.com' }
  let(:year)       { ['2010'] }
  let(:year_in_words) { "two thousand and ten" }

  let :image do
    Image.create(title:     title,
                creator:    creator,
                keyword:    keyword,
                visibility: visibility,
                depositor:  user,
                year:       year)
  end

  scenario "Show a public Image" do
    visit("/concern/images/#{image.id}")

    expect(page).to have_content image.title.first
    expect(page).to have_content image.creator.first
    expect(page).to have_content image.keyword.first
    expect(page).to have_content image.keyword.last
    expect(page).to have_content year_in_words
  end
end
