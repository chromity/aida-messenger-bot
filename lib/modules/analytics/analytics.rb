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

      def transpose_matrix
        
      end
    end
  end
end