block outer:
    for i in 1..4:
        for j in 1..6:
            echo i,"+",j,"=",i+j
            if j mod i==0 and j!=i and j!=1 and i!=1:
                break outer
