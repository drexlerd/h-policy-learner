

(define (problem BW-rand-224)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 )
(:init
(arm-empty)
(on b1 b31)
(on b2 b84)
(on b3 b98)
(on b4 b213)
(on b5 b102)
(on b6 b30)
(on b7 b136)
(on b8 b145)
(on b9 b195)
(on b10 b147)
(on b11 b56)
(on b12 b143)
(on b13 b40)
(on b14 b57)
(on b15 b170)
(on-table b16)
(on b17 b179)
(on b18 b158)
(on b19 b142)
(on b20 b116)
(on b21 b24)
(on-table b22)
(on b23 b34)
(on b24 b91)
(on b25 b94)
(on b26 b47)
(on b27 b106)
(on b28 b165)
(on b29 b149)
(on b30 b100)
(on b31 b218)
(on b32 b118)
(on b33 b173)
(on b34 b124)
(on b35 b152)
(on b36 b65)
(on b37 b192)
(on b38 b103)
(on b39 b177)
(on b40 b82)
(on b41 b198)
(on-table b42)
(on b43 b14)
(on b44 b13)
(on b45 b123)
(on b46 b156)
(on b47 b132)
(on b48 b121)
(on b49 b212)
(on b50 b69)
(on b51 b50)
(on b52 b22)
(on b53 b183)
(on b54 b105)
(on b55 b197)
(on b56 b41)
(on b57 b133)
(on b58 b216)
(on-table b59)
(on b60 b185)
(on b61 b146)
(on b62 b39)
(on b63 b107)
(on b64 b206)
(on b65 b88)
(on b66 b166)
(on b67 b6)
(on-table b68)
(on b69 b199)
(on b70 b162)
(on b71 b209)
(on b72 b19)
(on b73 b108)
(on b74 b157)
(on b75 b10)
(on b76 b95)
(on b77 b76)
(on b78 b161)
(on b79 b115)
(on b80 b114)
(on b81 b204)
(on b82 b99)
(on b83 b217)
(on b84 b208)
(on b85 b187)
(on b86 b223)
(on b87 b96)
(on b88 b3)
(on b89 b46)
(on b90 b207)
(on b91 b110)
(on b92 b74)
(on b93 b180)
(on b94 b62)
(on b95 b174)
(on b96 b141)
(on b97 b140)
(on b98 b109)
(on b99 b127)
(on b100 b28)
(on b101 b172)
(on b102 b104)
(on b103 b97)
(on b104 b175)
(on b105 b92)
(on-table b106)
(on b107 b154)
(on b108 b188)
(on b109 b219)
(on b110 b78)
(on b111 b190)
(on b112 b79)
(on b113 b26)
(on b114 b194)
(on b115 b128)
(on b116 b71)
(on b117 b169)
(on b118 b11)
(on b119 b83)
(on b120 b93)
(on b121 b101)
(on b122 b148)
(on b123 b67)
(on b124 b4)
(on b125 b137)
(on b126 b64)
(on b127 b60)
(on b128 b54)
(on b129 b85)
(on b130 b138)
(on b131 b167)
(on b132 b176)
(on b133 b44)
(on b134 b5)
(on b135 b25)
(on b136 b89)
(on b137 b27)
(on b138 b214)
(on b139 b130)
(on b140 b196)
(on b141 b112)
(on-table b142)
(on b143 b38)
(on b144 b15)
(on b145 b203)
(on b146 b117)
(on-table b147)
(on b148 b125)
(on b149 b151)
(on b150 b81)
(on-table b151)
(on b152 b12)
(on b153 b20)
(on b154 b48)
(on-table b155)
(on b156 b182)
(on b157 b55)
(on b158 b210)
(on b159 b61)
(on b160 b75)
(on b161 b77)
(on b162 b168)
(on b163 b201)
(on b164 b222)
(on b165 b215)
(on b166 b58)
(on b167 b150)
(on b168 b211)
(on-table b169)
(on b170 b139)
(on b171 b73)
(on b172 b184)
(on b173 b49)
(on b174 b42)
(on b175 b181)
(on b176 b205)
(on b177 b68)
(on-table b178)
(on b179 b45)
(on b180 b129)
(on b181 b23)
(on b182 b17)
(on b183 b35)
(on b184 b18)
(on-table b185)
(on b186 b63)
(on-table b187)
(on b188 b164)
(on b189 b90)
(on b190 b126)
(on b191 b36)
(on b192 b155)
(on b193 b32)
(on b194 b159)
(on b195 b163)
(on b196 b122)
(on b197 b144)
(on-table b198)
(on b199 b193)
(on b200 b87)
(on b201 b202)
(on b202 b53)
(on b203 b200)
(on b204 b189)
(on b205 b43)
(on b206 b72)
(on b207 b134)
(on b208 b221)
(on b209 b8)
(on b210 b59)
(on b211 b52)
(on b212 b21)
(on b213 b135)
(on b214 b119)
(on b215 b153)
(on b216 b113)
(on b217 b160)
(on b218 b80)
(on b219 b7)
(on b220 b191)
(on-table b221)
(on b222 b70)
(on b223 b37)
(on b224 b9)
(clear b1)
(clear b2)
(clear b16)
(clear b29)
(clear b33)
(clear b51)
(clear b66)
(clear b86)
(clear b111)
(clear b120)
(clear b131)
(clear b171)
(clear b178)
(clear b186)
(clear b220)
(clear b224)
)
(:goal
(and
(on b1 b2))
)
)


