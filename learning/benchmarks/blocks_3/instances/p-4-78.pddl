

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4  - block)
(:init
(on-table b1)
(on b2 b3)
(on b3 b1)
(on-table b4)
(clear b2)
(clear b4)
)
(:goal
(and
(on b1 b3)
(on b2 b1)
(on b3 b4))
)
)


