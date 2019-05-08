class CalculatorController < ApplicationController

  def new

  end

  def create
    @result = Calculator.evaluate_string(params['string'])

    render :new
  end

end
