# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def setup
    @stack = Stack.new(['foo'])
  end

  def test_addition
    @stack.push! 'bar'
    assert { @stack.size == 2 }
    assert { @stack.to_a.last == 'bar' }
  end

  def test_pop_method
    @stack.push! 'bar'
    @stack.push! 'baz'
    @stack.pop!
    assert { @stack.to_a.last == 'bar' }
  end

  def test_clear_method
    @stack.clear!
    assert { @stack.empty? }
  end

  def test_stack_not_empty
    refute { @stack.empty? }
  end

  def test_stack_is_empty
    @stack.pop!
    assert { @stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
