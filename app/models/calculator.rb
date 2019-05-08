class Calculator

  def self.evaluate_string(string)
    array = [string]


  end

  def self.parse_string(string)
    operators = ['+','-','*','/']
    string = string.split('')
    array = []
    number = ''

    string.each do |character|
      if operators.include?(character)
        array << number.to_i if number.present?
        array << character.to_sym
        number = ''
      else
        number << character
      end
    end

    array << number.to_i if number.present?

    array
  end

  def self.evaluate(a, operator, b)
    a.send(operator, b)
  end

end
