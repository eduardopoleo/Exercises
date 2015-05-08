h ={ abc: 'hello', 'another_key' => 123, 4567 => 'third', :a_very_long_key => 'something', 4 => 'a number', 'rr'=> 'whatever'  }

def key_ordering(h)
  result = []
  h.keys.map(&:to_s).each do |key|
    if result.size == 0
      result << key
      next
    end

    iterations_left = result.size
    result.each_with_index do |element, index|
      if element.size > key.size
        result.insert(index, key)
        break
      end

      iterations_left -= 1
      if iterations_left ==0
        result << key
      end
    end
  end
  result
end


p key_ordering(h)
























