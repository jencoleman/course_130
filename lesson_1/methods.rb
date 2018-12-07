require 'pry'

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end
  
  def add(item)
    self.todos.push(item)
  end
  
  def <<(item)
    add(item)
  end
  
  def first
    todos.first
  end
  
  def last
    todos.last
  end

  def size
    todos.size
  end
  
  def item_at(num)
    todos[num]
  end
  
  def mark_done_at(num)
    self.item_at(num).done!
  end
  
  def mark_undone_at(num)
    self.item_at(num).undone!
  end
  
  def shift
    self.todos.shift
  end
  
  def pop
    self.todos.pop
  end
  
  def remove_at(num)
    self.todos.delete_at(num)
  end
  
  def to_s
    result = ["Today's Todos"]
    todos.each { |item| result.push(item.to_s) }
    puts result.flatten
  end
  
  def to_a
    todos
  end
  
  def each
    todos.each do |item|
      yield(item)
    end
    self
  end
  
  def select
    result = TodoList.new("Selected Todos")
    todos.select { |item| result.add(item) if yield(item) }

    result
  end
  
  def find_by_title(string)
    select { |item| item.title == string }
  end
  
  def all_done
    select { |item| item.done? }
  end
  
  def all_not_done
    select { |item| !item.done? }
  end
  
  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end
  
  def mark_all_done
    each { |item| item.done! }
  end
  
  def mark_all_undone
    each { |item| item.undone! }
  end
  
end
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

list.find_by_title("Buy milk").inspect