require 'time'

system("sudo apt-get update && sudo apt-get install -y curl openssh-server ca-certificates")
system("curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash")
system("sudo apt-get -y install gitlab-ee=10.3.0-ee.0")
system("/opt/gitlab/embedded/bin/runsvdir-start &")
system("sudo gitlab-ctl reconfigure")
system("sudo apt-get -y install gitlab-ee=10.4.0-ee.0")
log_location = "/var/log/apt/term.log"
system("tac #{log_location} | sed '/^Log started/q' | tac > /tmp/upgrade.log")
start_string = File.open("/tmp/upgrade.log").grep(/Log started/)[0].strip.gsub("Log started: ", "")
end_string = File.open("/tmp/upgrade.log").grep(/Log ended/)[0].strip.gsub("Log ended: ", "")
puts "Log Started at " + start_string
puts "Log Ended at " + end_string
start_time = DateTime.strptime(start_string, "%Y-%m-%d  %H:%M:%S")
end_time = DateTime.strptime(end_string, "%Y-%m-%d  %H:%M:%S")
duration_in_secs = ((end_time - start_time) * 24 * 60 * 60).to_i
item = "10.4.0-ee.0, #{duration_in_secs}"

puts item