

(define (problem BW-rand-210)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 )
(:init
(arm-empty)
(on b1 b107)
(on b2 b202)
(on b3 b199)
(on b4 b189)
(on b5 b63)
(on b6 b44)
(on b7 b208)
(on b8 b131)
(on b9 b122)
(on b10 b175)
(on b11 b123)
(on b12 b132)
(on b13 b104)
(on b14 b77)
(on b15 b177)
(on b16 b115)
(on-table b17)
(on b18 b205)
(on b19 b190)
(on-table b20)
(on b21 b58)
(on b22 b57)
(on b23 b135)
(on b24 b164)
(on b25 b128)
(on b26 b102)
(on b27 b19)
(on b28 b141)
(on b29 b95)
(on b30 b149)
(on b31 b34)
(on b32 b171)
(on b33 b86)
(on b34 b193)
(on b35 b32)
(on b36 b78)
(on b37 b50)
(on b38 b88)
(on b39 b76)
(on b40 b52)
(on b41 b188)
(on b42 b120)
(on b43 b97)
(on b44 b89)
(on b45 b178)
(on b46 b41)
(on b47 b49)
(on b48 b24)
(on b49 b85)
(on b50 b65)
(on b51 b200)
(on b52 b13)
(on b53 b3)
(on b54 b206)
(on b55 b40)
(on b56 b119)
(on b57 b10)
(on b58 b153)
(on-table b59)
(on b60 b118)
(on b61 b116)
(on b62 b71)
(on b63 b27)
(on b64 b134)
(on b65 b108)
(on b66 b73)
(on b67 b169)
(on b68 b75)
(on b69 b42)
(on b70 b8)
(on b71 b180)
(on b72 b39)
(on b73 b17)
(on b74 b106)
(on b75 b152)
(on b76 b124)
(on b77 b113)
(on-table b78)
(on-table b79)
(on b80 b168)
(on b81 b198)
(on b82 b179)
(on b83 b156)
(on b84 b170)
(on b85 b146)
(on b86 b155)
(on b87 b23)
(on b88 b101)
(on b89 b105)
(on b90 b74)
(on b91 b70)
(on b92 b161)
(on b93 b55)
(on b94 b68)
(on b95 b184)
(on b96 b82)
(on b97 b167)
(on b98 b29)
(on b99 b1)
(on b100 b165)
(on b101 b99)
(on b102 b129)
(on b103 b87)
(on b104 b182)
(on b105 b36)
(on b106 b103)
(on b107 b148)
(on b108 b160)
(on b109 b7)
(on b110 b197)
(on b111 b151)
(on b112 b162)
(on b113 b22)
(on-table b114)
(on b115 b145)
(on b116 b163)
(on b117 b126)
(on b118 b16)
(on b119 b121)
(on b120 b2)
(on b121 b125)
(on b122 b191)
(on b123 b176)
(on b124 b14)
(on b125 b181)
(on-table b126)
(on b127 b54)
(on b128 b173)
(on b129 b45)
(on b130 b94)
(on b131 b203)
(on b132 b6)
(on-table b133)
(on b134 b80)
(on b135 b147)
(on b136 b100)
(on b137 b67)
(on b138 b194)
(on b139 b140)
(on-table b140)
(on b141 b59)
(on b142 b209)
(on b143 b11)
(on b144 b72)
(on b145 b51)
(on-table b146)
(on b147 b166)
(on b148 b174)
(on b149 b183)
(on b150 b53)
(on b151 b47)
(on b152 b18)
(on b153 b4)
(on b154 b84)
(on b155 b28)
(on b156 b26)
(on b157 b5)
(on b158 b62)
(on b159 b35)
(on b160 b158)
(on b161 b46)
(on b162 b64)
(on-table b163)
(on b164 b109)
(on b165 b154)
(on b166 b60)
(on b167 b112)
(on b168 b25)
(on b169 b136)
(on b170 b133)
(on b171 b66)
(on b172 b91)
(on b173 b143)
(on b174 b144)
(on b175 b142)
(on b176 b138)
(on-table b177)
(on b178 b37)
(on b179 b56)
(on b180 b192)
(on b181 b31)
(on b182 b172)
(on b183 b130)
(on b184 b201)
(on b185 b150)
(on b186 b111)
(on b187 b9)
(on b188 b83)
(on b189 b207)
(on b190 b117)
(on b191 b90)
(on b192 b81)
(on b193 b20)
(on b194 b159)
(on b195 b12)
(on b196 b93)
(on b197 b195)
(on b198 b186)
(on b199 b110)
(on b200 b69)
(on b201 b137)
(on b202 b21)
(on b203 b92)
(on b204 b15)
(on b205 b157)
(on b206 b114)
(on b207 b33)
(on b208 b139)
(on b209 b187)
(on b210 b98)
(clear b30)
(clear b38)
(clear b43)
(clear b48)
(clear b61)
(clear b79)
(clear b96)
(clear b127)
(clear b185)
(clear b196)
(clear b204)
(clear b210)
)
(:goal
(and
(clear b1))
)
)


