(define (problem auv-3D-problem1)
	(:domain auv-2D-1)

	(:init 
        (can-move)
        (= (x) 0)
        (= (y) 0)
        (= (max_x) 3)
        (= (max_y) 3)
    )

	(:goal
		(and
            (sample-takenA) (sample-takenB) (sample-takenC) ))

)