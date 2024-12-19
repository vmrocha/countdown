# Countdown Timer

A simple Ruby gem that displays a countdown timer to a specified future date with millisecond precision.

# How to use

## As a library

```ruby
require 'countdown_timer'

print "Enter target date (YYYY-MM-DD HH:MM:SS): "
target_date_str = gets.chomp
target_date = Time.parse(target_date_str)

CountdownTimer::Timer.countdown_to(target_date) do |days, hours, minutes, seconds, ms|
  print "\r#{days}d #{hours}h #{minutes}m #{seconds}s #{ms}ms"
end
```

## As a console application

```
$ countdown 2025-12-16 12:10:59
```

or

```
$ countdown
Enter target date (YYYY-MM-DD HH:MM:SS): 2025-12-16 12:10:59
```
