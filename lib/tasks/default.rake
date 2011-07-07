task :snoop => :environment do
  Rubygem.all.each do |rubygem|
    num_updated = rubygem.snoop
    puts "Found #{num_updated.size} new releases of #{rubygem.name}"
  end
end
