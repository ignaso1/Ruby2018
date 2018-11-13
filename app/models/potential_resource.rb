class PotentialResource < ApplicationRecord
    def initialize
        @information = { id: nil,
                         position: nil,
                         full_name: nil }
        @information[:comments] = []
      end
    
      def create(position, salary, full_name = nil)
        @information[:id] = self
        @information[:full_name] = full_name
        @information[:position] = position
        @information[:salary] = salary
      end
    
      def edit_info(symbol, value)
        @information[symbol.to_sym] = value
      end
    
      def add_comment(comment)
        @information.fetch(:comments).push(comment)
      end
    
      def remove_comment(comment)
        @information.fetch(:comments).delete(comment)
      end
    
      def exists?
        return true unless @information.fetch(:id).equal?(nil)
    
        false
      end
    
      def information(symbol)
        @information.fetch(symbol.to_sym)
      end
end
