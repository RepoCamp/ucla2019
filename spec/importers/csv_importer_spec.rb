# frozen_string_literal: true

require 'rails_helper'
require 'active_fedora/cleaner'

RSpec.describe CsvImporter do
  let(:one_line_example)       { 'spec/fixtures/one_line_example.csv' }
  let(:three_line_example)     { 'spec/fixtures/three_line_example.csv' }
  let(:user) { ::User.batch_user }

  before do
    DatabaseCleaner.clean
    ActiveFedora::Cleaner.clean!
  end

  it "imports a csv" do
    expect { CsvImporter.new(three_line_example).import }.to change { Image.count }.by 3
  end

  it "puts the title into the title field" do
    CsvImporter.new(one_line_example).import
    imported_image = Image.first
    expect(imported_image.title.first).to eq 'A Cute Dog'
  end

  it "puts the url into the source field" do
    CsvImporter.new(one_line_example).import
    imported_image = Image.first
    expect(imported_image.source.first).to eq 'https://www.pexels.com/photo/animal-blur-canine-close-up-551628/'
  end

  it "creates publicly visible objects" do
    CsvImporter.new(one_line_example).import
    imported_image = Image.first
    expect(imported_image.visibility).to eq 'open'
  end

  it "attaches a file" do
    CsvImporter.new(one_line_example).import
    imported_image = Image.first
    expect(imported_image.members.first).to be_instance_of(FileSet)
    expect(imported_image.members.first.title.first).to eq 'dog.jpg'
  end
end
