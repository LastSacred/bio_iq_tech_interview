class Calculator

  def self.evaluate_string(string)
    array = parse_string(string)


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

  def self.evaluate_array(array)
    a = array.shift
    operator = array.shift
    b = array.shift

    array.unshift(a.send(operator, b))

    return array[0] if array.count == 1

    return evaluate_array(array)
  end

end
