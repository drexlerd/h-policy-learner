(define (problem grid-x2-y2-t1-k2-l2-p100)
(:domain grid)
(:objects 
        f0-0f f1-0f 
        f0-1f f1-1f 
        shape0 
        key0-0 key0-1 
)
(:init
(arm-empty)
(place f0-0f)
(place f1-0f)
(place f0-1f)
(place f1-1f)
(shape shape0)
(key key0-0)
(key-shape key0-0 shape0)
(key key0-1)
(key-shape key0-1 shape0)
(conn f0-0f f1-0f)
(conn f0-1f f1-1f)
(conn f0-0f f0-1f)
(conn f1-0f f1-1f)
(conn f1-0f f0-0f)
(conn f1-1f f0-1f)
(conn f0-1f f0-0f)
(conn f1-1f f1-0f)
(open f1-0f)
(open f0-1f)
(locked f0-0f)
(lock-shape f0-0f shape0)
(locked f1-1f)
(lock-shape f1-1f shape0)
(at key0-0 f1-0f)
(at key0-1 f1-1f)
(at-robot f0-1f)
)
(:goal
(and
(at key0-0 f1-0f)
(at key0-1 f0-0f)
)
)
)
