

(define (problem BW-rand-3)
(:domain blocksworld)
(:objects b3 )
(:init
(arm-empty)
(on-table b1)
(on-table b2)
(on-table b3)
(clear b1)
(clear b2)
(clear b3)
)
(:goal
(and
(clear b1))
)
)


