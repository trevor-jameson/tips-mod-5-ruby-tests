require 'active_support'
require 'active_support/core_ext'
require 'pry'

class RecurringMoment
  def initialize(start:, interval:, period:)
    @start = start
    @interval = interval
    @period = period
  end

  def match(date)
    counter = @interval
    current = @start
    while current <= date
      if current == date
        return true
      end
      
      if @period == 'monthly'
        current = @start.advance(months: counter)
      elsif @period == 'weekly'
        current = @start.advance(weeks: counter)
      elsif @period == 'daily'
        current = @start.advance(days: counter)
      end
      counter += @interval
    end

    return false
  end
end