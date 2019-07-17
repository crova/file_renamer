#!/bin/ruby

path = ARGV[0]
files = Dir.foreach(path).select { |x| File.file?("#{path}/#{x}") }

files.each do |file|
  new_file_name = file
    .gsub(' ', '') # removes empty spaces
    .unicode_normalize(:nfkd).encode('ASCII', replace: '') # find and replace special chars
  File.rename(path + file, path + new_file_name) # rename the file
  puts "Rename from " + file + " to " + new_file_name # print some info
end
