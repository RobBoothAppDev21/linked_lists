# frozen_string_literal: true

# require_relative 'linked_list'

# class containing a #value method and linke to the #next_node. Both set to nil
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    p "(#{value}) ->"
  end
end
