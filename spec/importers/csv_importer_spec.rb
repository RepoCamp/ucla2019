# frozen_string_literal: true
ENV['IMPORT_FILE_PATH'] = "spec/fixtures/images"

require 'rails_helper'
require 'active_fedora/cleaner'

RSpec.describe CsvImporter do
  let(:one_line_example)   { 'spec/fixtures/one_line_example.csv' }
  let(:three_line_example) { 'spec/fixtures/three_line_example.csv' }
  let(:user)               { ::User.batch_user }

  before do
    DatabaseCleaner.clean
    ActiveFedora::Cleaner.clean!
  end

  it  'imports a csv' do
    expect { CsvImporter.new(three_line_example).import }.to change { Image.count }
  end
end
