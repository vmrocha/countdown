require 'spec_helper'

RSpec.describe Countdown::Timer do
  describe '.version' do
    it 'returns the current version' do
      expect(described_class.version).to eq(Countdown::VERSION)
    end
  end

  describe '.countdown_to' do
    let(:future_time) { Time.now + 10 }
    let(:output) { StringIO.new }

    before do
      $stdout = output
    end

    after do
      $stdout = STDOUT
    end

    it 'yields time components when block given' do
      components = []
      Timecop.freeze do
        thread = Thread.new do
          described_class.countdown_to(future_time) do |d, h, m, s, ms|
            components = [d, h, m, s, ms]
            Thread.exit
          end
        end
        thread.join(0.1)
      end

      expect(components[0]).to eq(0)  # days
      expect(components[1]).to eq(0)  # hours
      expect(components[2]).to eq(0)  # minutes
      expect(components[3]).to eq(10) # seconds
      expect(components[4]).to be_between(0, 999) # milliseconds
    end

    it 'prints "Time\'s up!" when countdown finishes' do
      past_time = Time.now - 1
      described_class.countdown_to(past_time)
      expect(output.string).to include("Time's up!")
    end
  end
end
