

(define (problem BW-rand-206)
(:domain blocksworld)
(:objects b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 )
(:init
(arm-empty)
(on b1 b27)
(on b2 b29)
(on b3 b193)
(on-table b4)
(on b5 b146)
(on b6 b56)
(on b7 b63)
(on b8 b141)
(on b9 b196)
(on b10 b159)
(on b11 b185)
(on b12 b105)
(on b13 b110)
(on b14 b135)
(on b15 b202)
(on b16 b35)
(on b17 b201)
(on b18 b111)
(on b19 b34)
(on b20 b11)
(on b21 b1)
(on b22 b50)
(on b23 b188)
(on-table b24)
(on b25 b109)
(on b26 b139)
(on b27 b186)
(on b28 b15)
(on b29 b26)
(on b30 b117)
(on b31 b33)
(on b32 b160)
(on b33 b149)
(on-table b34)
(on b35 b178)
(on-table b36)
(on b37 b133)
(on b38 b112)
(on b39 b38)
(on b40 b52)
(on b41 b30)
(on b42 b198)
(on b43 b12)
(on b44 b138)
(on b45 b88)
(on b46 b206)
(on b47 b144)
(on b48 b22)
(on b49 b57)
(on b50 b68)
(on b51 b10)
(on b52 b194)
(on b53 b103)
(on b54 b190)
(on b55 b195)
(on b56 b36)
(on b57 b181)
(on b58 b51)
(on b59 b183)
(on-table b60)
(on b61 b85)
(on b62 b77)
(on b63 b157)
(on b64 b32)
(on b65 b20)
(on b66 b107)
(on b67 b156)
(on b68 b80)
(on b69 b4)
(on b70 b79)
(on b71 b119)
(on b72 b95)
(on b73 b53)
(on b74 b189)
(on b75 b87)
(on b76 b192)
(on b77 b73)
(on b78 b168)
(on b79 b42)
(on b80 b170)
(on b81 b191)
(on b82 b99)
(on b83 b205)
(on b84 b76)
(on b85 b98)
(on b86 b82)
(on b87 b147)
(on b88 b163)
(on b89 b154)
(on b90 b140)
(on b91 b66)
(on b92 b126)
(on b93 b62)
(on b94 b60)
(on b95 b153)
(on b96 b120)
(on b97 b179)
(on b98 b5)
(on b99 b169)
(on b100 b180)
(on-table b101)
(on-table b102)
(on b103 b45)
(on b104 b100)
(on-table b105)
(on b106 b101)
(on b107 b72)
(on b108 b92)
(on b109 b203)
(on b110 b136)
(on b111 b173)
(on b112 b84)
(on b113 b132)
(on b114 b37)
(on b115 b2)
(on b116 b74)
(on b117 b28)
(on b118 b69)
(on b119 b55)
(on b120 b197)
(on b121 b49)
(on b122 b91)
(on b123 b48)
(on b124 b39)
(on b125 b113)
(on b126 b176)
(on-table b127)
(on b128 b158)
(on b129 b41)
(on b130 b40)
(on b131 b46)
(on b132 b43)
(on b133 b152)
(on b134 b3)
(on b135 b128)
(on b136 b96)
(on b137 b187)
(on b138 b137)
(on b139 b89)
(on b140 b21)
(on b141 b114)
(on-table b142)
(on b143 b9)
(on b144 b131)
(on b145 b177)
(on-table b146)
(on-table b147)
(on b148 b67)
(on b149 b124)
(on b150 b167)
(on b151 b166)
(on b152 b172)
(on b153 b6)
(on b154 b16)
(on-table b155)
(on b156 b44)
(on b157 b19)
(on b158 b106)
(on b159 b123)
(on b160 b162)
(on b161 b116)
(on b162 b184)
(on b163 b17)
(on b164 b151)
(on b165 b94)
(on b166 b200)
(on b167 b155)
(on b168 b125)
(on b169 b61)
(on b170 b143)
(on b171 b122)
(on b172 b83)
(on b173 b165)
(on b174 b134)
(on-table b175)
(on-table b176)
(on b177 b93)
(on b178 b127)
(on b179 b59)
(on b180 b78)
(on-table b181)
(on b182 b70)
(on b183 b31)
(on b184 b97)
(on b185 b161)
(on b186 b115)
(on b187 b175)
(on b188 b64)
(on b189 b23)
(on b190 b130)
(on b191 b121)
(on b192 b8)
(on b193 b164)
(on b194 b18)
(on b195 b90)
(on-table b196)
(on b197 b71)
(on b198 b204)
(on b199 b65)
(on b200 b182)
(on b201 b58)
(on b202 b24)
(on b203 b171)
(on b204 b14)
(on b205 b142)
(on b206 b54)
(clear b7)
(clear b13)
(clear b25)
(clear b47)
(clear b75)
(clear b81)
(clear b86)
(clear b102)
(clear b104)
(clear b108)
(clear b118)
(clear b129)
(clear b145)
(clear b148)
(clear b150)
(clear b174)
(clear b199)
)
(:goal
(and
(clear b1))
)
)


