block outer:
  for i in 1..10:
    for j in 1..10:
      if i+j == 10:
        echo i, "+", j, "=", 10
        break outer
