begin
  value = gets.to_i
  factorial_result = 1

  for i in 1..value
    factorial_result *= i

    while (factorial_result % 10) == 0
      factorial_result /= 10
    end

    factorial_result %= 100000000000
  end

  factorial_result = factorial_result.to_s

  DISPLAY_DIGITS = 9
  if factorial_result.length > DISPLAY_DIGITS
    factorial_result = factorial_result.slice(factorial_result.length - DISPLAY_DIGITS, DISPLAY_DIGITS)
  end

  puts factorial_result.to_i
end