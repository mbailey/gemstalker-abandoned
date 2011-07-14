desc "Check for new releases"
task :snoop => :environment do
  Rubygem.all.each do |rubygem|
    num_updated = rubygem.snoop
    puts "Found #{num_updated.size} new releases of #{rubygem.name}"
  end
end

desc "Destroy latest release"
task :prune => :environment do
  Rubygem.all.each { |rubygem| 
    rubygem.releases.order('release_date desc').limit(5).map(&:destroy)
  }
end

desc "List rubygems"
task :gems => :environment do
  puts Rubygem.order('name desc').map(&:name)
end
