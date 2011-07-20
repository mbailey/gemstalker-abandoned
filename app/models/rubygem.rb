# require 'mechanize'
require 'net/https'
require 'uri'

class RubygemValidator < ActiveModel::Validator
  def validate(record)
    uri = URI.parse("https://rubygems.org/gems/#{record.name}/versions.html")
    http_session = Net::HTTP.new(uri.host, uri.port)
    http_session.use_ssl = true if uri.port == 443
    if http_session.get("https://rubygems.org/gems/#{record.name}/versions.html").code != '200'
      record.errors[:base] << "Couldn't find gem #{record.name}"
    end
  end
end

class Rubygem < ActiveRecord::Base

  has_many :follows
  has_many :users, :through => :follows

  has_many :releases, :dependent => :destroy

  has_many :alerts, :through => :releases

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_with RubygemValidator 

  def snoop
    new_releases = get_releases
    new_releases.select {|r| releases << r }
  end

  def latest_stable_release
    releases.order('release_date desc').where(:pre => false).first
  end

  def latest_stable_release
    releases.order('release_date desc').where(:pre => false).first
  end

  def latest_pre_release
    releases.order('release_date desc').where(:pre => true).first
  end

  def get_releases
    page = load_releases_page
    releases = extract_releases(page)
  end

  def load_releases_page
    releases_url = "https://rubygems.org/gems/#{name}/versions.html"
    agent.get(releases_url)
  rescue
    puts "Error: Failed to get #{releases_url}"
  end

  def extract_releases(page)
    result = []
    releases = page.search("//div[@class='versions']/ol/li/a")
    dates = page.search("//div[@class='versions']/ol/li/small")
    releases.each_with_index do |v,k|
      result << Release.new( 
        :rubygem_name => name,
        :version => releases[k].content,
        :release_date => dates[k].content,
        :url     => releases[k][:href],
        :pre     => releases[k].content =~ (/[a-zA-Z]/) ? true : false
      )
    end
    result
  end

  private
  
  def agent
    @agent ||= Mechanize.new
    # @agent.user_agent = USER_AGENT
    @agent
  end

end
