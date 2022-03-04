# frozen_string_literal: true

require 'pry-byebug'
require_relative 'node'

# class to represent the full list
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def set_tail
    @tail = at(size - 1)
  end

  def append(value)
    new_node = Node.new(value)
    @head ||= new_node
    if tail.nil?
      @tail = new_node
    else
      tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value, head)
    self.head = new_node
  end

  def size
    count = 0
    current_node = head
    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def at(index)
    count = 0
    current_node = head
    until count == index
      count += 1
      current_node = current_node.next_node
    end
    return current_node if count == index
  end

  def pop
    'Empty list' if head.nil?
    current_node = head
    current_node = current_node.next_node until current_node.next_node == tail
    @tail = current_node
    current_node.next_node = nil
    tail
  end

  def contains?(value)
    current_node = head
    until current_node == tail
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    count = 0
    current_node = head
    until current_node == tail
      return count if current_node.value == value

      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = head
    list_string = +''
    until current_node.nil?
      list_string << if current_node.next_node.nil?
                       "( #{current_node.value} ) -> ( nil )"
                     else
                       "( #{current_node.value} ) -> "
                     end
      current_node = current_node.next_node
    end
    list_string
  end

  def insert_at(value, index)
    return append(value) if head.nil?

    return prepend(value) if index.zero?

    if index >= size
      last_node = at(size - 1)
      last_node.next_node = Node.new(value)
    elsif index.positive? && index < size
      previous_node = at(index - 1)
      new_node = Node.new(value, at(index))
      previous_node.next_node = new_node
    end
    set_tail
  end

  def remove_at(index)
    return 'List is already empty' if head.nil?

    return 'A node does not exist at that index' if index >= size

    return @head = at(index).next_node if index.zero?

    unless at(index).nil?
      previous_node = at(index - 1)
      previous_node.next_node = at(index).next_node
    end
    set_tail
  end
end

list = LinkedList.new
# binding.pry
list.append(1)
list.append(2)
list.append(3)
list.insert_at(5, 4)
# binding.pry
# binding.pry