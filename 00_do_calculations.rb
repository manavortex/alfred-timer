#!/usr/bin/ruby

require 'time'

# split at first space - first bit is timestamp
args = ARGV[0].split(' ', 2)

# first, take care of time
	timeString = args[0]
	timeString = timeString.gsub(/(?<=\d)[hm]/, ":").gsub(/(?<=\d)s/, "")

	timeAry = timeString.split(":")
	while timeAry.length < 3 do timeAry.unshift "00" end

	# assign to variables to avoid "string to fixnum" exception
	hours = timeAry[0].to_i
	minutes = timeAry[1].to_i
	seconds = timeAry[2].to_i

	destTime = Time.now + seconds + (minutes * 60) + (hours * 60 * 60)

topic = args[1]
message = topic ? "\"#{topic}\"" : ""

	notificationString = "at -f tmpfile.txt -t #{destTime.strftime('%s')} "

	File.open('tmpfile.txt', 'w') { |file| file.write("display notification #{message} with title \"Your timer has passed\"") }

	print notificationString