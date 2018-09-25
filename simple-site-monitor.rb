require 'optparse'
require 'ostruct'
require 'open-uri'
require 'csv'

# Parse command line input
options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-s', '--site SITE', 'URL to be checked') { |o| options.site = o }
  opt.on('-p', '--pattern PATTERN', 'search string') { |o| options.pattern = o }
  opt.on('-l', '--log LOG', 'log file name') { |o| options.log = o }
end.parse!

# Open URL
source = open(options.site, &:read)

# Look for pattern
if source.include? options.pattern
	result = "UP"
else
	result = "DOWN"
end

# Log result to CSV file
CSV.open(options.log, "a") do |csv|
  csv << [Time.now, result, options.site, options.pattern]
end