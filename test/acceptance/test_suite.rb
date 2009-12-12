require 'test/unit'
require 'test/unit/ui/console/testrunner'

require 'calculator_driver'

class CalculatorTestSuite < Test::Unit::TestSuite
  
  include CalculatorDriver
  
  def run(result, &progress_block)
    activate_calculator_app
    begin
      super(result, &progress_block)
    ensure
      quit_calculator_app
    end
  end

end

require 'basic_test'
require 'addition_test'
require 'subtraction_test'
require 'multiplication_test'
require 'division_test'

suite = CalculatorTestSuite.new('Calculator Acceptance Tests')
suite << BasicTest.suite
suite << AdditionTest.suite
suite << SubtractionTest.suite
suite << MultiplicationTest.suite
suite << DivisionTest.suite

runner = Test::Unit::UI::Console::TestRunner.new(suite, Test::Unit::UI::VERBOSE)
runner.start