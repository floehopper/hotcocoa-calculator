require File.expand_path(File.join(File.dirname(__FILE__), '..', 'test_helper'))

require 'accumulator'

class AccumulatorTest < Test::Unit::TestCase
  
  def setup
    @accumulator = Accumulator.new
  end
  
  def test_initial_evaluate
    result = @accumulator.evaluate
    assert_in_delta 0.0, result, 1e-8
  end
  
  def test_evaluate_after_no_operations
    @accumulator.push(123.0)
    result = @accumulator.evaluate
    assert_in_delta 123.0, result, 1e-8
  end
  
  def test_evaluate_addition_operation
    @accumulator.push(123.0)
    @accumulator.push('+')
    @accumulator.push(456.0)
    result = @accumulator.evaluate
    assert_in_delta 579.0, result, 1e-8
  end
  
  def test_evaluate_subtraction_operation
    @accumulator.push(579.0)
    @accumulator.push('-')
    @accumulator.push(456.0)
    result = @accumulator.evaluate
    assert_in_delta 123.0, result, 1e-8
  end
  
  def test_evaluate_multiplication_operation
    @accumulator.push(123.0)
    @accumulator.push('*')
    @accumulator.push(456.0)
    result = @accumulator.evaluate
    assert_in_delta 56088.0, result, 1e-8
  end
  
  def test_evaluate_division_operation
    @accumulator.push(56088.0)
    @accumulator.push('/')
    @accumulator.push(456.0)
    result = @accumulator.evaluate
    assert_in_delta 123.0, result, 1e-8
  end
  
  def test_multiple_operations
    @accumulator.push(123.0)
    @accumulator.push('+')
    @accumulator.push(579.0)
    @accumulator.push('-')
    @accumulator.push(456.0)
    result = @accumulator.evaluate
    assert_in_delta 246.0, result, 1e-8
  end
  
end