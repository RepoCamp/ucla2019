# frozen_string_literal: true
 CSV_FILE = "#{::Rails.root}/spec/fixtures/three_line_example.csv"
 namespace :sample do
  desc 'Import the three line sample CSV'
  task :import_three_line_csv => [:environment] do |_task|
    CsvImporter.new(CSV_FILE).import
  end
   desc 'Import a different CSV'
  task :import, [:filename] => [:environment] do |_task, args|
    csv_file = args[:filename]
    CsvImporter.new(csv_file).import
  end
end
