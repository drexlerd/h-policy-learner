

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(arm-empty)
(on b1 b3)
(on b2 b4)
(on b3 b2)
(on-table b4)
(clear b1)
)
(:goal
(and
(clear b1))
)
)


