require 'csv'

class CsvImporter
  def initialize(file)
    @file = file
    @user = ::User.batch_user
  end

  def import
    CSV.foreach(@file) do |row|
      image = Image.new
      image.title = [row[1]]
      image.source = [row[2]]
      image.visibility = "open"
      image.depositor = @user.email
      # Attach the image file and run it through the actor stack
      # Try entering Hyrax::CurationConcern.actor on a console to see all of the

      # To set when running the rake task:
      # $ IMPORT_FILE_PATH=opt/data rake sample:import[bluestar_test1.csv]
      image_binary = File.open("#{ENV['IMPORT_FILE_PATH']}/#{row[0]}")
      uploaded_file = Hyrax::UploadedFile.create(user: @user, file: image_binary)
      attributes_for_actor = { uploaded_files: [uploaded_file.id] }
      env = Hyrax::Actors::Environment.new(image, ::Ability.new(@user), attributes_for_actor)
      Hyrax::CurationConcern.actor.create(env)
      image_binary.close
    end
  end
end
