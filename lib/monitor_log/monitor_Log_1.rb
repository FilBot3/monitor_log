#!/usr/bin/env ruby
#
# http://stackoverflow.com/questions/1293695/watch-read-a-growing-log-file-with-ruby
#

require 'optparse'

# Initialize the Option Parser, this will create command line arguments.
opts = OptionParser.new
opts.on('-f FILE', '--file FILE', String, "Input file to monitor") { |v|
  # Get the file name to be monitored.
  @filename = v
}
opts.on('-p PATTERN', '--pattern PATTERN', String, "Pattern to match in the file") { |v|
  # get the pattern to match that will be inside the file.
  @pattern = v
}
opts.on('-h', '--help', "Show this screen") {
  # Print the help screen, which is the list of arguments.
  puts opts
  exit
}

# Attempt to parse the arguments given. If there is an error, report what
# happened.
begin
  opts.parse!(ARGV)
rescue OptionParser::ParseError => e
  puts e
end

# Raise an error if any of the arguments are missing.
#raise OptionParser::MissingArgument, "Hostname [-H]" if @hostname.nil?
#raise OptionParser::MissingArgument, "Port Number [-P]" if @portnumber.nil?

def watch_for(filename, pattern)
  # Open the file to monitored in READ-ONLY mode
  f = File.open(filename,"r")
  # http://ruby-doc.org/core-2.1.1/IO.html#method-i-seek
  # Seek to th end of the file
  f.seek(0,IO::SEEK_END)
  # Until the program is exited, perform the next block.
  while true do
    # http://docs.ruby-doc.com/docs/ProgrammingRuby/html/ref_m_kernel.html#Kernel.select
    # select([?]) waits until there is new input, and then gets the line, and
    # then applies the pattern to the new line.
    select([f])
    line = f.gets
    # If the pattern is matched, perform an action
    puts "Found #{@pattern} in #{line}" if line =~ /#{pattern}/
    sleep(2)
  end
end # of watch_for

def send_email_os
  # send an email using the OS's local email facility.
  Thread.new do
    %x[ "echo \"#{@pattern} found\" | mailx -s \"#{@pattern} found\" email@address.com" ]
  end
end

# Execute the
watch_for(@filename, @pattern)
