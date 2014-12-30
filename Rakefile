require "bundler/gem_tasks"
require "fileutils"

desc "Building distributable executables"
namespace :build do
  desc "Generate a JRuby Warbler JAR"
  task :jar do
    puts "=> Generating the JRuby JAR"
    sh "jruby -S warble executable jar"
    puts "=> Moving the JAR to the pkg folder"
    FileUtils.mv("./monitor_log.jar", "./pkg/monitor_log.jar")
  end
end
