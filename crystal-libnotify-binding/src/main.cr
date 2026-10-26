require "./lib_notify"

emitter = Transform::NotificationEmitter.new
at_exit { Transform::NotificationEmitter.shutdown }

if emitter.emit("Transform complete", "The notification came from Crystal.")
  puts "notification sent"
else
  STDERR.puts "notification could not be sent"
  exit 1
end
