

(define (problem BW-rand-222)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 )
(:init
(arm-empty)
(on b1 b28)
(on b2 b148)
(on b3 b127)
(on b4 b3)
(on b5 b97)
(on b6 b220)
(on b7 b95)
(on b8 b193)
(on b9 b99)
(on-table b10)
(on b11 b137)
(on b12 b215)
(on b13 b199)
(on b14 b144)
(on-table b15)
(on b16 b196)
(on b17 b60)
(on b18 b167)
(on b19 b200)
(on b20 b222)
(on b21 b184)
(on b22 b206)
(on-table b23)
(on b24 b160)
(on b25 b94)
(on b26 b116)
(on b27 b31)
(on b28 b147)
(on b29 b51)
(on b30 b128)
(on b31 b5)
(on b32 b9)
(on-table b33)
(on b34 b135)
(on b35 b8)
(on b36 b66)
(on b37 b143)
(on b38 b4)
(on b39 b40)
(on b40 b183)
(on b41 b177)
(on b42 b216)
(on b43 b14)
(on b44 b155)
(on b45 b56)
(on b46 b126)
(on b47 b140)
(on b48 b80)
(on b49 b59)
(on b50 b75)
(on-table b51)
(on b52 b201)
(on b53 b37)
(on-table b54)
(on b55 b54)
(on b56 b125)
(on b57 b217)
(on b58 b45)
(on b59 b112)
(on b60 b36)
(on b61 b142)
(on b62 b106)
(on b63 b96)
(on b64 b91)
(on b65 b214)
(on b66 b32)
(on b67 b113)
(on b68 b145)
(on b69 b13)
(on b70 b29)
(on b71 b92)
(on b72 b49)
(on b73 b2)
(on b74 b138)
(on b75 b194)
(on b76 b58)
(on b77 b211)
(on b78 b169)
(on b79 b197)
(on b80 b21)
(on b81 b48)
(on b82 b27)
(on b83 b102)
(on b84 b150)
(on b85 b180)
(on b86 b1)
(on b87 b151)
(on b88 b203)
(on b89 b46)
(on b90 b82)
(on b91 b61)
(on-table b92)
(on b93 b209)
(on b94 b57)
(on b95 b157)
(on b96 b42)
(on-table b97)
(on b98 b195)
(on b99 b64)
(on b100 b171)
(on b101 b76)
(on b102 b221)
(on b103 b189)
(on b104 b131)
(on b105 b132)
(on b106 b81)
(on b107 b22)
(on b108 b78)
(on b109 b85)
(on b110 b84)
(on b111 b204)
(on b112 b38)
(on b113 b25)
(on-table b114)
(on b115 b18)
(on b116 b210)
(on b117 b114)
(on b118 b133)
(on b119 b146)
(on b120 b154)
(on b121 b53)
(on b122 b50)
(on b123 b212)
(on b124 b188)
(on b125 b86)
(on b126 b152)
(on b127 b74)
(on b128 b16)
(on b129 b168)
(on b130 b181)
(on b131 b44)
(on b132 b52)
(on b133 b109)
(on b134 b139)
(on-table b135)
(on b136 b104)
(on b137 b166)
(on b138 b165)
(on b139 b67)
(on b140 b77)
(on b141 b158)
(on b142 b120)
(on b143 b17)
(on b144 b134)
(on b145 b208)
(on b146 b26)
(on b147 b33)
(on-table b148)
(on b149 b12)
(on b150 b162)
(on b151 b10)
(on b152 b93)
(on b153 b192)
(on b154 b205)
(on b155 b47)
(on b156 b170)
(on b157 b87)
(on b158 b149)
(on b159 b202)
(on b160 b7)
(on b161 b62)
(on b162 b207)
(on-table b163)
(on b164 b69)
(on b165 b218)
(on b166 b71)
(on b167 b219)
(on b168 b118)
(on b169 b213)
(on b170 b15)
(on b171 b24)
(on b172 b130)
(on b173 b119)
(on b174 b156)
(on b175 b35)
(on b176 b68)
(on b177 b187)
(on-table b178)
(on b179 b176)
(on b180 b103)
(on b181 b30)
(on b182 b185)
(on b183 b110)
(on-table b184)
(on b185 b88)
(on b186 b178)
(on b187 b20)
(on b188 b122)
(on b189 b89)
(on b190 b100)
(on b191 b115)
(on b192 b105)
(on b193 b11)
(on b194 b129)
(on b195 b153)
(on b196 b6)
(on b197 b186)
(on-table b198)
(on b199 b65)
(on b200 b117)
(on b201 b55)
(on b202 b43)
(on b203 b41)
(on b204 b107)
(on b205 b39)
(on b206 b161)
(on b207 b163)
(on b208 b23)
(on b209 b72)
(on b210 b198)
(on b211 b108)
(on b212 b191)
(on b213 b172)
(on b214 b173)
(on b215 b136)
(on b216 b141)
(on b217 b73)
(on b218 b79)
(on b219 b164)
(on b220 b111)
(on b221 b70)
(on b222 b123)
(clear b19)
(clear b34)
(clear b63)
(clear b83)
(clear b90)
(clear b98)
(clear b101)
(clear b121)
(clear b124)
(clear b159)
(clear b174)
(clear b175)
(clear b179)
(clear b182)
(clear b190)
)
(:goal
(and
(clear b1))
)
)


