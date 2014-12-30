# Monitor_Log

Monitor_Log does just that. Specifying a couple command line arguments and it'll monitor a file for any input matching the given pattern.

## Installation

Add this line to your application's Gemfile:
*This is not yet ready*

```ruby
gem 'monitor_log'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monitor_log

## Usage

When compiled in JRuby using Warbler, run the JAR as such:

```bash    
java -jar monitor_log.jar -f /path/to/file.log -p PATTERN
```

As long as Java is installed, and in the PATH, it will run, and be sure to put the program into the background.

## Compiling  

### JRuby JAR

To compile as a JRuby JAR, be sure that JRuby is installed, and that the Warbler gem is installed. Then run the rake task to compile and place the JAR. To find the rake task, just execute `rake -T`.

### Ruby OCRA (coming soon)

## Contributing

1. Fork it ( https://github.com/predatorian3/monitor_log/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
