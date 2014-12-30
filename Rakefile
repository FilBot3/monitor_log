require "bundler/gem_tasks"
require "fileutils"

desc "Building distributable executables"
namespace :create do

  desc "Generate a JRuby Warbler JAR"
  task :jar do
    puts "=> Generating the JRuby JAR"
    sh "jruby -S warble executable jar"
    puts "=> Moving the JAR to the pkg folder"
    FileUtils.mv("./monitor_log.jar", "./pkg/monitor_log.jar")
  end

end

desc "Run an executable"
namespace :run do

  desc "Run the JRuby JAR"
  task :jar do
    puts "=> Running the JRuby JAR with Java"
    sh "java -jar monitor_log --help"
    puts "=> End Run"
  end

  desc "Run the bundle exec with Ruby"
  task :bundle do
    puts "=> Running with Ruby Bundle Exec"
    sh "bundle exec ruby bin/monitor_log --help"
    puts "=> End Run"
  end

  desc "Run the jbundle exec with JRuby"
  task :jbundle do
    puts "=> Running with JRuby JBundle Exec"
    sh "jbundle exec jruby bin/monitor_log --help"
    puts "=> End Run"
  end

end
