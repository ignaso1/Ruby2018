require 'date'
# Comments are used to express opinions on resources or projects
class Comment
  def initialize(author, content)
    @information = { creation_date: Date.today,
                     comment_id: self,
                     author: nil,
                     content: nil }
    @information[:comment_id] = self
    @information[:author] = author
    @information[:content] = content
  end

  def info(symbol)
    @information.fetch(symbol.to_sym)
  end
end
