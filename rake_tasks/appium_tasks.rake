###
# This file contains all Appium specific tasks
###

require 'open4'


###
# Tasks
###

desc 'Starts the appium server'
task :start_appium_server do
  stop_appium_server
  start_appium_server
end

desc 'Stops the Appium server'
task :stop_appium_server do
  stop_appium_server
end


###
# Helpers
###

def stop_node_process(pid:)
  Process.kill('TERM', pid)
end

def stop_appium_server
  `pgrep node`.each_line.map(&:to_i).map { |pid| stop_node_process(pid: pid) }
end

def start_appium_server
  log_filename = File.expand_path('./../../', __FILE__) + '/appium_server.log'

  command = "appium --port 5555 --log #{log_filename} --local-timezone 1>&2"
  puts "Starting Appium server (log: #{log_filename})"
  Dir.chdir('./') {
    pid, stdin, stdout, stderr = Open4::popen4(command)
    sleep 20

    if pid.zero?
      puts 'Appium server did not start'
      exit(false)
    else
      puts "Appium server is running with PID: #{pid}"
    end
  }
end
