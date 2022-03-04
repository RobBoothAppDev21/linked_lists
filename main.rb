# frozen_string_literal: true

require 'pry-byebug'
require_relative 'linked_list'
require_relative 'node'

list = LinkedList.new
list.append(1)
list.append(2)
list.append(3)
list.head
list.head.next_node
binding.pry
list.tail
list.to_s

