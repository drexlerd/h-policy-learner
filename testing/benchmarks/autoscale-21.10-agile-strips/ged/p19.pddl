;; original sequence 1: (1 27 2 17 36 20 3 29 10 11 35 12 30 21 9 19 18 28 33 7 8 16 26 14 34 13 24 15 32 25 4 22 23 6 31 5)
;; original sequence 2: (1 35 10 30 29 11 24 3 23 15 25 27 26 7 14 36 4 19 12 22 20 2 21 13 6 16 32 28 17 34 9 18 31 5 33 8)
;; simplified sequence 1: (1 27 2 17 36 20 3 29 10 11 35 12 30 21 9 19 18 28 33 7 8 16 26 14 34 13 24 15 32 25 4 22 23 6 37)
;; simplified sequence 2: (1 35 10 30 29 11 24 3 23 15 25 27 26 7 14 36 4 19 12 22 20 2 21 13 6 16 32 28 17 34 9 18 37 33 8)
;; common subsequences: (((31 5) . 37))
;; #safe insertions/deletions: 0
;; sequence 1 (names): ((NORMAL COX1) (NORMAL N) (NORMAL COX2) (NORMAL D) (NORMAL Y) (NORMAL G) (NORMAL COX3) (NORMAL Q) (NORMAL NAD6) (NORMAL COB) (NORMAL W) (NORMAL ATP6) (NORMAL R) (NORMAL H) (NORMAL NAD5) (NORMAL F) (NORMAL E) (NORMAL P) (NORMAL T) (NORMAL NAD4L) (NORMAL NAD4) (NORMAL C) (NORMAL M) (NORMAL RRNS) (NORMAL V) (NORMAL RRNL) (NORMAL L1) (NORMAL A) (NORMAL S2) (NORMAL L2) (NORMAL NAD1) (NORMAL I) (NORMAL K) (NORMAL NAD3) (NORMAL SUB1))
;; sequence 2 (names): ((NORMAL COX1) (NORMAL W) (NORMAL NAD6) (NORMAL R) (NORMAL Q) (NORMAL COB) (NORMAL L1) (NORMAL COX3) (NORMAL K) (NORMAL A) (NORMAL L2) (NORMAL N) (NORMAL M) (NORMAL NAD4L) (NORMAL RRNS) (NORMAL Y) (NORMAL NAD1) (NORMAL F) (NORMAL ATP6) (NORMAL I) (NORMAL G) (NORMAL COX2) (NORMAL H) (NORMAL RRNL) (NORMAL NAD3) (NORMAL C) (NORMAL S2) (NORMAL P) (NORMAL D) (NORMAL V) (NORMAL NAD5) (NORMAL E) (NORMAL SUB1) (NORMAL T) (NORMAL NAD4))

(DEFINE (PROBLEM LUMBRICUS-TERRESTRIS-TO-ONCHOCERCA-VOLVULUS)
        (:DOMAIN GENOME-EDIT-DISTANCE)
        (:OBJECTS SUB1 Y W V T S2 R Q P N M L2 L1 K I H G F E D C A
            RRNS RRNL ATP6 COB NAD6 NAD5 NAD4 NAD4L NAD3 NAD1 COX3 COX2
            COX1)
        (:INIT (NORMAL COX1) (NORMAL N) (NORMAL COX2) (NORMAL D)
               (NORMAL Y) (NORMAL G) (NORMAL COX3) (NORMAL Q)
               (NORMAL NAD6) (NORMAL COB) (NORMAL W) (NORMAL ATP6)
               (NORMAL R) (NORMAL H) (NORMAL NAD5) (NORMAL F)
               (NORMAL E) (NORMAL P) (NORMAL T) (NORMAL NAD4L)
               (NORMAL NAD4) (NORMAL C) (NORMAL M) (NORMAL RRNS)
               (NORMAL V) (NORMAL RRNL) (NORMAL L1) (NORMAL A)
               (NORMAL S2) (NORMAL L2) (NORMAL NAD1) (NORMAL I)
               (NORMAL K) (NORMAL NAD3) (NORMAL SUB1) (PRESENT COX1)
               (PRESENT N) (PRESENT COX2) (PRESENT D) (PRESENT Y)
               (PRESENT G) (PRESENT COX3) (PRESENT Q) (PRESENT NAD6)
               (PRESENT COB) (PRESENT W) (PRESENT ATP6) (PRESENT R)
               (PRESENT H) (PRESENT NAD5) (PRESENT F) (PRESENT E)
               (PRESENT P) (PRESENT T) (PRESENT NAD4L) (PRESENT NAD4)
               (PRESENT C) (PRESENT M) (PRESENT RRNS) (PRESENT V)
               (PRESENT RRNL) (PRESENT L1) (PRESENT A) (PRESENT S2)
               (PRESENT L2) (PRESENT NAD1) (PRESENT I) (PRESENT K)
               (PRESENT NAD3) (PRESENT SUB1) (CW SUB1 COX1)
               (CW NAD3 SUB1) (CW K NAD3) (CW I K) (CW NAD1 I)
               (CW L2 NAD1) (CW S2 L2) (CW A S2) (CW L1 A) (CW RRNL L1)
               (CW V RRNL) (CW RRNS V) (CW M RRNS) (CW C M) (CW NAD4 C)
               (CW NAD4L NAD4) (CW T NAD4L) (CW P T) (CW E P) (CW F E)
               (CW NAD5 F) (CW H NAD5) (CW R H) (CW ATP6 R) (CW W ATP6)
               (CW COB W) (CW NAD6 COB) (CW Q NAD6) (CW COX3 Q)
               (CW G COX3) (CW Y G) (CW D Y) (CW COX2 D) (CW N COX2)
               (CW COX1 N) (IDLE) (= (TOTAL-COST) 0))
        (:GOAL (AND (NORMAL COX1) (NORMAL W) (NORMAL NAD6) (NORMAL R)
                    (NORMAL Q) (NORMAL COB) (NORMAL L1) (NORMAL COX3)
                    (NORMAL K) (NORMAL A) (NORMAL L2) (NORMAL N)
                    (NORMAL M) (NORMAL NAD4L) (NORMAL RRNS) (NORMAL Y)
                    (NORMAL NAD1) (NORMAL F) (NORMAL ATP6) (NORMAL I)
                    (NORMAL G) (NORMAL COX2) (NORMAL H) (NORMAL RRNL)
                    (NORMAL NAD3) (NORMAL C) (NORMAL S2) (NORMAL P)
                    (NORMAL D) (NORMAL V) (NORMAL NAD5) (NORMAL E)
                    (NORMAL SUB1) (NORMAL T) (NORMAL NAD4)
                    (CW NAD4 COX1) (CW T NAD4) (CW SUB1 T) (CW E SUB1)
                    (CW NAD5 E) (CW V NAD5) (CW D V) (CW P D) (CW S2 P)
                    (CW C S2) (CW NAD3 C) (CW RRNL NAD3) (CW H RRNL)
                    (CW COX2 H) (CW G COX2) (CW I G) (CW ATP6 I)
                    (CW F ATP6) (CW NAD1 F) (CW Y NAD1) (CW RRNS Y)
                    (CW NAD4L RRNS) (CW M NAD4L) (CW N M) (CW L2 N)
                    (CW A L2) (CW K A) (CW COX3 K) (CW L1 COX3)
                    (CW COB L1) (CW Q COB) (CW R Q) (CW NAD6 R)
                    (CW W NAD6) (CW COX1 W)))
        (:METRIC MINIMIZE (TOTAL-COST)))