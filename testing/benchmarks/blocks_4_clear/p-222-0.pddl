

(define (problem BW-rand-222)
(:domain blocksworld)
(:objects b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 )
(:init
(arm-empty)
(on b1 b120)
(on b2 b194)
(on b3 b85)
(on b4 b20)
(on-table b5)
(on b6 b7)
(on b7 b148)
(on-table b8)
(on b9 b207)
(on b10 b62)
(on b11 b191)
(on b12 b116)
(on b13 b125)
(on b14 b182)
(on b15 b127)
(on b16 b155)
(on b17 b149)
(on b18 b128)
(on b19 b66)
(on b20 b151)
(on b21 b199)
(on b22 b107)
(on b23 b10)
(on b24 b135)
(on b25 b27)
(on b26 b19)
(on b27 b104)
(on b28 b169)
(on b29 b211)
(on b30 b189)
(on b31 b202)
(on b32 b103)
(on b33 b193)
(on b34 b153)
(on b35 b218)
(on b36 b210)
(on b37 b29)
(on b38 b119)
(on b39 b177)
(on b40 b79)
(on b41 b214)
(on b42 b73)
(on b43 b46)
(on b44 b16)
(on b45 b56)
(on b46 b40)
(on b47 b217)
(on b48 b13)
(on-table b49)
(on b50 b160)
(on b51 b90)
(on b52 b32)
(on b53 b192)
(on b54 b157)
(on b55 b67)
(on b56 b154)
(on b57 b187)
(on b58 b173)
(on b59 b117)
(on b60 b113)
(on b61 b146)
(on b62 b138)
(on b63 b91)
(on b64 b44)
(on b65 b175)
(on b66 b42)
(on b67 b93)
(on b68 b137)
(on b69 b204)
(on b70 b33)
(on b71 b215)
(on b72 b37)
(on b73 b48)
(on b74 b82)
(on b75 b81)
(on b76 b89)
(on b77 b136)
(on b78 b59)
(on b79 b178)
(on b80 b162)
(on b81 b68)
(on b82 b164)
(on b83 b18)
(on b84 b78)
(on b85 b25)
(on b86 b112)
(on b87 b54)
(on b88 b87)
(on b89 b47)
(on b90 b123)
(on b91 b206)
(on b92 b141)
(on b93 b118)
(on b94 b97)
(on b95 b203)
(on b96 b171)
(on b97 b5)
(on b98 b36)
(on b99 b221)
(on b100 b75)
(on b101 b23)
(on b102 b201)
(on b103 b100)
(on b104 b22)
(on b105 b38)
(on b106 b185)
(on b107 b208)
(on b108 b12)
(on b109 b1)
(on b110 b209)
(on b111 b3)
(on b112 b70)
(on b113 b183)
(on b114 b144)
(on b115 b106)
(on-table b116)
(on b117 b52)
(on b118 b205)
(on b119 b190)
(on b120 b134)
(on b121 b197)
(on b122 b126)
(on b123 b188)
(on b124 b102)
(on b125 b219)
(on b126 b63)
(on b127 b174)
(on b128 b131)
(on b129 b220)
(on b130 b186)
(on b131 b34)
(on b132 b58)
(on b133 b11)
(on b134 b172)
(on b135 b168)
(on b136 b121)
(on b137 b105)
(on b138 b176)
(on b139 b39)
(on b140 b96)
(on b141 b14)
(on b142 b65)
(on b143 b49)
(on-table b144)
(on b145 b45)
(on-table b146)
(on b147 b170)
(on b148 b35)
(on b149 b115)
(on b150 b222)
(on b151 b124)
(on b152 b142)
(on-table b153)
(on b154 b195)
(on b155 b101)
(on b156 b147)
(on b157 b71)
(on b158 b15)
(on b159 b161)
(on b160 b8)
(on b161 b83)
(on b162 b43)
(on b163 b132)
(on b164 b57)
(on b165 b24)
(on b166 b130)
(on b167 b212)
(on b168 b200)
(on b169 b152)
(on b170 b110)
(on b171 b74)
(on b172 b60)
(on b173 b99)
(on-table b174)
(on b175 b156)
(on b176 b61)
(on b177 b95)
(on b178 b92)
(on b179 b4)
(on b180 b158)
(on b181 b9)
(on-table b182)
(on b183 b77)
(on b184 b76)
(on b185 b109)
(on b186 b163)
(on b187 b165)
(on-table b188)
(on b189 b216)
(on b190 b133)
(on b191 b179)
(on b192 b196)
(on b193 b167)
(on b194 b181)
(on b195 b198)
(on b196 b50)
(on b197 b21)
(on b198 b88)
(on b199 b55)
(on b200 b69)
(on b201 b6)
(on b202 b150)
(on b203 b180)
(on b204 b72)
(on b205 b143)
(on b206 b30)
(on b207 b41)
(on b208 b86)
(on b209 b17)
(on b210 b111)
(on b211 b2)
(on b212 b108)
(on b213 b114)
(on b214 b31)
(on b215 b122)
(on b216 b184)
(on b217 b94)
(on b218 b159)
(on b219 b28)
(on b220 b98)
(on b221 b213)
(on b222 b145)
(clear b26)
(clear b51)
(clear b53)
(clear b64)
(clear b80)
(clear b84)
(clear b129)
(clear b139)
(clear b140)
(clear b166)
)
(:goal
(and
(clear b1))
)
)


