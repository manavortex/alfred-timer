require 'time'

# split at first space - first bit is timestamp
args = (ARGV[0] or "").split(' ', 2)

def trimString(message="")
	if not message then return "" end
	return message.strip ? message.strip : message 
end

def getDiffInSeconds(timeString)

	if not timeString then 
		throw Exception.new("you need to pass a time!")
	end
	# first, take care of time
	timeString =  timeString.end_with?("h") ? timeString + "00m" : timeString
	timeString =  timeString.end_with?("m") ? timeString + "00s" : timeString

	timeString = timeString.gsub(/(?<=\d)[hm]/, ":").gsub(/(?<=\d)s/, "")

	timeAry = timeString.split(":")
	while timeAry.length < 3 do timeAry.unshift "00" end

	# assign to variables to avoid "string to fixnum" exception
	hours = timeAry[0].to_i
	minutes = timeAry[1].to_i
	seconds = timeAry[2].to_i

	destTime = Time.now + seconds + (minutes * 60) + (hours * 60 * 60)

	diffInSecs = (destTime - Time.now).abs.round
	
	return trimString("#{diffInSecs}")
end


print [getDiffInSeconds(args[0]), trimString(args[1])]