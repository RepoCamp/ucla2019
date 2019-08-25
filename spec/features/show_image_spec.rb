require 'rails_helper'

RSpec.feature 'Display an Image' do
  let(:title)      { ['Journey to Skull Island'] }
  let(:creator)    { ['Quest, Jane'] }
  let(:keyword)    { ['Pirates', 'Adventure'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let(:user)       { 'test@example.com' }
  let(:year)       { ['2010'] }

  let :image do
    Image.create(title:      title,
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
    expect(page).to have_content image.year.first
  end
end
