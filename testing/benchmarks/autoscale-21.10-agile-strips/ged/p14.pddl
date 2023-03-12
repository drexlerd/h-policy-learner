;; original sequence 1: (1 34 13 24 15 10 28 9 4 7 11 17 16 19 2 36 35 20 21 -29 -25 -27 -12 -30 -18 -14 26 -6 -32 -33 -3 31 8 22 5 23)
;; original sequence 2: (1 25 2 23 17 12 3 20 6 15 30 27 31 18 -19 -9 -21 -8 -7 33 -28 10 11 32 -4 -24 -13 -34 -14 26 5 35 -22 -29 -16 -36)
;; simplified sequence 1: (1 37 15 10 28 9 4 7 11 17 16 19 2 36 35 20 21 -29 -25 -27 -12 -30 -18 38 -6 -32 -33 -3 31 8 22 5 23)
;; simplified sequence 2: (1 25 2 23 17 12 3 20 6 15 30 27 31 18 -19 -9 -21 -8 -7 33 -28 10 11 32 -4 -37 38 5 35 -22 -29 -16 -36)
;; common subsequences: (((34 13 24) . 37) ((-14 26) . 38))
;; #safe insertions/deletions: 0
;; sequence 1 (names): ((NORMAL COX1) (NORMAL SUB1) (NORMAL A) (NORMAL NAD6) (NORMAL P) (NORMAL NAD5) (NORMAL NAD1) (NORMAL NAD4L) (NORMAL COB) (NORMAL D) (NORMAL C) (NORMAL F) (NORMAL COX2) (NORMAL Y) (NORMAL W) (NORMAL G) (NORMAL H) (INVERTED Q) (INVERTED L2) (INVERTED N) (INVERTED ATP6) (INVERTED R) (INVERTED E) (NORMAL SUB2) (INVERTED NAD3) (INVERTED S2) (INVERTED T) (INVERTED COX3) (NORMAL S1) (NORMAL NAD4) (NORMAL I) (NORMAL NAD2) (NORMAL K))
;; sequence 2 (names): ((NORMAL COX1) (NORMAL L2) (NORMAL COX2) (NORMAL K) (NORMAL D) (NORMAL ATP6) (NORMAL COX3) (NORMAL G) (NORMAL NAD3) (NORMAL A) (NORMAL R) (NORMAL N) (NORMAL S1) (NORMAL E) (INVERTED F) (INVERTED NAD5) (INVERTED H) (INVERTED NAD4) (INVERTED NAD4L) (NORMAL T) (INVERTED P) (NORMAL NAD6) (NORMAL COB) (NORMAL S2) (INVERTED NAD1) (INVERTED SUB1) (NORMAL SUB2) (NORMAL NAD2) (NORMAL W) (INVERTED I) (INVERTED Q) (INVERTED C) (INVERTED Y))

(DEFINE (PROBLEM CEPAEA-NEMORALIS-TO-ARTEMIA-FRANCISCANA)
        (:DOMAIN GENOME-EDIT-DISTANCE)
        (:OBJECTS SUB2 SUB1 Y W T S2 S1 R Q P N L2 K I H G F E D C A
            ATP6 COB NAD6 NAD5 NAD4 NAD4L NAD3 NAD2 NAD1 COX3 COX2
            COX1)
        (:INIT (NORMAL COX1) (NORMAL SUB1) (NORMAL A) (NORMAL NAD6)
               (NORMAL P) (NORMAL NAD5) (NORMAL NAD1) (NORMAL NAD4L)
               (NORMAL COB) (NORMAL D) (NORMAL C) (NORMAL F)
               (NORMAL COX2) (NORMAL Y) (NORMAL W) (NORMAL G)
               (NORMAL H) (INVERTED Q) (INVERTED L2) (INVERTED N)
               (INVERTED ATP6) (INVERTED R) (INVERTED E) (NORMAL SUB2)
               (INVERTED NAD3) (INVERTED S2) (INVERTED T)
               (INVERTED COX3) (NORMAL S1) (NORMAL NAD4) (NORMAL I)
               (NORMAL NAD2) (NORMAL K) (PRESENT COX1) (PRESENT SUB1)
               (PRESENT A) (PRESENT NAD6) (PRESENT P) (PRESENT NAD5)
               (PRESENT NAD1) (PRESENT NAD4L) (PRESENT COB) (PRESENT D)
               (PRESENT C) (PRESENT F) (PRESENT COX2) (PRESENT Y)
               (PRESENT W) (PRESENT G) (PRESENT H) (PRESENT Q)
               (PRESENT L2) (PRESENT N) (PRESENT ATP6) (PRESENT R)
               (PRESENT E) (PRESENT SUB2) (PRESENT NAD3) (PRESENT S2)
               (PRESENT T) (PRESENT COX3) (PRESENT S1) (PRESENT NAD4)
               (PRESENT I) (PRESENT NAD2) (PRESENT K) (CW K COX1)
               (CW NAD2 K) (CW I NAD2) (CW NAD4 I) (CW S1 NAD4)
               (CW COX3 S1) (CW T COX3) (CW S2 T) (CW NAD3 S2)
               (CW SUB2 NAD3) (CW E SUB2) (CW R E) (CW ATP6 R)
               (CW N ATP6) (CW L2 N) (CW Q L2) (CW H Q) (CW G H)
               (CW W G) (CW Y W) (CW COX2 Y) (CW F COX2) (CW C F)
               (CW D C) (CW COB D) (CW NAD4L COB) (CW NAD1 NAD4L)
               (CW NAD5 NAD1) (CW P NAD5) (CW NAD6 P) (CW A NAD6)
               (CW SUB1 A) (CW COX1 SUB1) (IDLE) (= (TOTAL-COST) 0))
        (:GOAL (AND (NORMAL COX1) (NORMAL L2) (NORMAL COX2) (NORMAL K)
                    (NORMAL D) (NORMAL ATP6) (NORMAL COX3) (NORMAL G)
                    (NORMAL NAD3) (NORMAL A) (NORMAL R) (NORMAL N)
                    (NORMAL S1) (NORMAL E) (INVERTED F) (INVERTED NAD5)
                    (INVERTED H) (INVERTED NAD4) (INVERTED NAD4L)
                    (NORMAL T) (INVERTED P) (NORMAL NAD6) (NORMAL COB)
                    (NORMAL S2) (INVERTED NAD1) (INVERTED SUB1)
                    (NORMAL SUB2) (NORMAL NAD2) (NORMAL W) (INVERTED I)
                    (INVERTED Q) (INVERTED C) (INVERTED Y) (CW Y COX1)
                    (CW C Y) (CW Q C) (CW I Q) (CW W I) (CW NAD2 W)
                    (CW SUB2 NAD2) (CW SUB1 SUB2) (CW NAD1 SUB1)
                    (CW S2 NAD1) (CW COB S2) (CW NAD6 COB) (CW P NAD6)
                    (CW T P) (CW NAD4L T) (CW NAD4 NAD4L) (CW H NAD4)
                    (CW NAD5 H) (CW F NAD5) (CW E F) (CW S1 E)
                    (CW N S1) (CW R N) (CW A R) (CW NAD3 A) (CW G NAD3)
                    (CW COX3 G) (CW ATP6 COX3) (CW D ATP6) (CW K D)
                    (CW COX2 K) (CW L2 COX2) (CW COX1 L2)))
        (:METRIC MINIMIZE (TOTAL-COST)))