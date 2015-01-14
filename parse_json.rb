#!/usr/bin/env ruby
require 'json'
if not File.exists? "data.json"
    p "data.json not found. read README to find out how to get it"
end

data = File.open("data.json", "r").read
json = JSON.parse data
links = []
json["section"]["presentations"]["pageContents"].reverse.each do |a|
    links.push "http://recordings.engineering.illinois.edu/ess/echo/presentation/#{a["uuid"]}/mediacontent.m4v"
end
output = File.open("output","w")
output.write(links.join "\n")
output.close()
