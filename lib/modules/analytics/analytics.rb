require 'rinruby'

module Analytics
	class Methods

    class << self

      def initialize
        functions = File.join(".","lib","modules","analytics","R","functions.R")
        R.eval("source('#{functions}')")        
      end

      def quartile(array)
        R.data = array
        R.pull("quartile(data)") rescue nil
      end

      def outliers(array)
        R.data = array
        R.pull("outliers(data)") rescue nil
      end
      
      def housing(initial,percentage, investment, days)
        R.initial = initial
        R.percentage = percentage
        R.investment = investment
        R.days = days
        R.pull("housing(initial,percentage, investment, days)") rescue nil
      end

      def sickness(initial,percentage, investment, days)
        R.initial = initial
        R.percentage = percentage
        R.investment = investment
        R.days = days
        R.pull("sickness(initial,percentage, investment, days)") rescue nil
      end

      def disability(initial,percentage, investment, days)
        R.initial = initial
        R.percentage = percentage
        R.investment = investment
        R.days = days
        R.pull("disability(initial,percentage, investment, days)") rescue nil
      end

      def maternity(initial,percentage, investment, days)
        R.initial = initial
        R.percentage = percentage
        R.investment = investment
        R.days = days
        R.pull("maternity(initial,percentage, investment, days)") rescue nil
      end

      def retirement(initial,percentage, investment, days)
        R.initial = initial
        R.percentage = percentage
        R.investment = investment
        R.days = days
        R.pull("retirement(initial,percentage, investment, days)") rescue nil
      end

      def funeral(initial,percentage, investment, days)
        R.initial = initial
        R.percentage = percentage
        R.investment = investment
        R.days = days
        R.pull("funeral(initial,percentage, investment, days)") rescue nil
      end

      def death(initial,percentage, investment, days)
        R.initial = initial
        R.percentage = percentage
        R.investment = investment
        R.days = days
        R.pull("death(initial,percentage, investment, days)") rescue nil
      end

      def education(initial,percentage, investment, days)
        R.initial = initial
        R.percentage = percentage
        R.investment = investment
        R.days = days
        R.pull("education(initial,percentage, investment, days)") rescue nil
      end
    end
  end
end