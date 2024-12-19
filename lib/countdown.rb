require 'date'
require 'time'
require 'countdown/version'

module Countdown
  def self.version
    VERSION
  end

  def self.countdown_to(target_date)
    loop do
      now = Time.now
      diff = target_date - now

      break if diff <= 0

      days = diff.to_i / 86400
      hours = (diff.to_i % 86400) / 3600
      minutes = (diff.to_i % 3600) / 60
      seconds = diff.to_i % 60
      milliseconds = ((diff - diff.to_i) * 1000).to_i

      if block_given?
        yield(days, hours, minutes, seconds, milliseconds)
      else
        print "\r#{days}d #{hours}h #{minutes}m #{seconds}s #{milliseconds}ms"
      end

      sleep 0.01
    end

    puts "\nTime's up!"
  end
end
