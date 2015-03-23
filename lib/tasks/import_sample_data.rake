namespace :import do
  desc "Import sample data"
  task :sample_data => :environment do
    puts "Importing sample data"

    %w{ secoast00 jferris }.each do |user|
      Actor.import user
    end

  end
end
