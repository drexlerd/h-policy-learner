

(define (problem BW-rand-210)
(:domain blocksworld)
(:objects b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 )
(:init
(arm-empty)
(on b1 b66)
(on b2 b35)
(on b3 b189)
(on b4 b84)
(on b5 b89)
(on b6 b94)
(on-table b7)
(on b8 b17)
(on b9 b33)
(on b10 b39)
(on b11 b102)
(on b12 b164)
(on-table b13)
(on b14 b76)
(on b15 b98)
(on b16 b7)
(on b17 b107)
(on b18 b68)
(on b19 b103)
(on b20 b146)
(on b21 b190)
(on b22 b13)
(on b23 b192)
(on b24 b12)
(on b25 b159)
(on b26 b37)
(on-table b27)
(on b28 b91)
(on b29 b177)
(on b30 b61)
(on b31 b29)
(on b32 b191)
(on b33 b100)
(on b34 b56)
(on b35 b111)
(on b36 b62)
(on b37 b27)
(on b38 b198)
(on b39 b88)
(on b40 b99)
(on b41 b73)
(on b42 b137)
(on b43 b123)
(on b44 b15)
(on b45 b93)
(on b46 b210)
(on b47 b194)
(on b48 b26)
(on b49 b64)
(on b50 b140)
(on b51 b124)
(on b52 b58)
(on b53 b43)
(on b54 b209)
(on b55 b144)
(on b56 b206)
(on b57 b201)
(on b58 b85)
(on b59 b19)
(on b60 b168)
(on b61 b108)
(on b62 b74)
(on b63 b125)
(on b64 b176)
(on b65 b145)
(on b66 b136)
(on b67 b54)
(on b68 b1)
(on b69 b63)
(on b70 b158)
(on b71 b101)
(on b72 b32)
(on b73 b90)
(on-table b74)
(on b75 b196)
(on b76 b143)
(on b77 b133)
(on b78 b69)
(on b79 b42)
(on b80 b117)
(on b81 b161)
(on b82 b112)
(on b83 b184)
(on b84 b160)
(on b85 b185)
(on-table b86)
(on b87 b152)
(on b88 b173)
(on b89 b106)
(on b90 b30)
(on b91 b162)
(on b92 b113)
(on b93 b5)
(on b94 b14)
(on b95 b200)
(on b96 b34)
(on b97 b204)
(on b98 b186)
(on b99 b135)
(on b100 b48)
(on b101 b180)
(on-table b102)
(on b103 b110)
(on b104 b40)
(on b105 b183)
(on b106 b155)
(on b107 b81)
(on b108 b71)
(on b109 b151)
(on b110 b202)
(on b111 b118)
(on b112 b178)
(on b113 b60)
(on b114 b51)
(on-table b115)
(on b116 b92)
(on b117 b65)
(on b118 b3)
(on b119 b147)
(on b120 b166)
(on b121 b77)
(on b122 b50)
(on b123 b87)
(on b124 b197)
(on b125 b157)
(on b126 b47)
(on b127 b38)
(on b128 b2)
(on b129 b120)
(on b130 b179)
(on b131 b53)
(on b132 b150)
(on b133 b82)
(on b134 b129)
(on b135 b203)
(on b136 b11)
(on b137 b130)
(on b138 b131)
(on b139 b72)
(on b140 b148)
(on b141 b24)
(on-table b142)
(on b143 b23)
(on b144 b132)
(on b145 b163)
(on b146 b153)
(on b147 b86)
(on b148 b126)
(on b149 b8)
(on b150 b41)
(on b151 b121)
(on b152 b208)
(on b153 b205)
(on b154 b28)
(on b155 b195)
(on b156 b181)
(on b157 b6)
(on-table b158)
(on b159 b20)
(on b160 b139)
(on b161 b199)
(on b162 b9)
(on-table b163)
(on b164 b104)
(on b165 b171)
(on-table b166)
(on b167 b52)
(on b168 b188)
(on b169 b46)
(on b170 b57)
(on b171 b114)
(on b172 b25)
(on b173 b45)
(on b174 b96)
(on-table b175)
(on b176 b59)
(on b177 b80)
(on b178 b174)
(on b179 b142)
(on b180 b16)
(on b181 b128)
(on b182 b36)
(on b183 b44)
(on b184 b21)
(on b185 b79)
(on b186 b55)
(on b187 b127)
(on b188 b67)
(on b189 b170)
(on b190 b115)
(on b191 b122)
(on b192 b10)
(on b193 b70)
(on b194 b172)
(on b195 b187)
(on b196 b154)
(on b197 b193)
(on b198 b18)
(on b199 b4)
(on b200 b22)
(on-table b201)
(on b202 b78)
(on-table b203)
(on b204 b156)
(on b205 b165)
(on b206 b207)
(on b207 b167)
(on b208 b49)
(on b209 b175)
(on b210 b83)
(clear b31)
(clear b75)
(clear b95)
(clear b97)
(clear b105)
(clear b109)
(clear b116)
(clear b119)
(clear b134)
(clear b138)
(clear b141)
(clear b149)
(clear b169)
(clear b182)
)
(:goal
(and
(clear b1))
)
)


