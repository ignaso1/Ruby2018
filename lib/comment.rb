require 'date'
# Comments are used to express opinions on resources or projects
class Comment
  attr_reader :information
  def initialize(author, content)
    @information = { creation_date: Date.today,
                     author: nil,
                     content: nil }
    @information[:id] = self
    @information[:author] = author
    @information[:content] = content
  end

  def info(symbol)
    @information.fetch(symbol.to_sym)
  end
end
