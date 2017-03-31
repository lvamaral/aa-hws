class Stack

  attr_accessor :stack_values

  def initialize(stack_values)
    @stack_values = stack_values
  end

  def add(el)
    stack_values << el
  end

  def remove
    stack_values.pop
  end

  def show
    stack_values.dup
  end
end
