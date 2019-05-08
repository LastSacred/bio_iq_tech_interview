class Calculator

  def self.evaluate_string(string)
    array = parse_string(string)
    evaluate_array(array)
  end

  private

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
    if index = array.find_index(:*) || array.find_index(:/)
      index = index - 1
    else
      index = 0
    end

    a = array.delete_at(index).to_f
    operator = array.delete_at(index)
    b = array.delete_at(index).to_f

    array.insert(index, a.send(operator, b))

    if array.count == 1
      result = array[0]
      result = result.to_i if result == result.to_i

      return result.round(2)
    end

    return array[0].round(2) if array.count == 1

    return evaluate_array(array)
  end

end
