

(define (problem BW-rand-246)
(:domain blocksworld)
(:objects b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 b225 b226 b227 b228 b229 b230 b231 b232 b233 b234 b235 b236 b237 b238 b239 b240 b241 b242 b243 b244 b245 b246 )
(:init
(arm-empty)
(on b1 b100)
(on-table b2)
(on b3 b218)
(on b4 b140)
(on b5 b147)
(on b6 b109)
(on b7 b172)
(on-table b8)
(on b9 b238)
(on b10 b126)
(on b11 b206)
(on b12 b87)
(on-table b13)
(on b14 b85)
(on b15 b76)
(on b16 b8)
(on b17 b170)
(on b18 b171)
(on b19 b168)
(on b20 b152)
(on b21 b204)
(on b22 b94)
(on b23 b200)
(on b24 b209)
(on b25 b44)
(on b26 b242)
(on b27 b70)
(on-table b28)
(on b29 b56)
(on b30 b214)
(on b31 b103)
(on b32 b237)
(on b33 b37)
(on b34 b20)
(on b35 b74)
(on b36 b222)
(on b37 b124)
(on b38 b58)
(on b39 b121)
(on b40 b106)
(on b41 b73)
(on b42 b160)
(on b43 b186)
(on b44 b131)
(on-table b45)
(on-table b46)
(on b47 b133)
(on b48 b57)
(on b49 b59)
(on-table b50)
(on b51 b111)
(on b52 b177)
(on b53 b202)
(on b54 b118)
(on b55 b105)
(on-table b56)
(on b57 b32)
(on b58 b145)
(on b59 b42)
(on b60 b149)
(on b61 b164)
(on b62 b80)
(on b63 b136)
(on b64 b208)
(on-table b65)
(on b66 b120)
(on b67 b116)
(on b68 b156)
(on b69 b127)
(on b70 b45)
(on b71 b81)
(on b72 b2)
(on b73 b148)
(on b74 b33)
(on b75 b51)
(on b76 b137)
(on b77 b159)
(on b78 b27)
(on b79 b178)
(on b80 b244)
(on b81 b92)
(on b82 b243)
(on b83 b226)
(on b84 b3)
(on b85 b25)
(on b86 b99)
(on b87 b46)
(on b88 b128)
(on b89 b122)
(on b90 b112)
(on-table b91)
(on b92 b48)
(on b93 b4)
(on b94 b79)
(on b95 b115)
(on b96 b98)
(on b97 b223)
(on b98 b188)
(on b99 b229)
(on b100 b91)
(on b101 b72)
(on b102 b96)
(on b103 b7)
(on b104 b68)
(on b105 b185)
(on b106 b215)
(on b107 b55)
(on b108 b66)
(on-table b109)
(on b110 b95)
(on b111 b62)
(on b112 b53)
(on b113 b198)
(on b114 b236)
(on b115 b162)
(on b116 b155)
(on b117 b191)
(on b118 b19)
(on b119 b10)
(on b120 b88)
(on b121 b24)
(on b122 b69)
(on b123 b245)
(on b124 b18)
(on b125 b67)
(on b126 b181)
(on b127 b83)
(on b128 b97)
(on b129 b154)
(on b130 b125)
(on b131 b189)
(on b132 b143)
(on b133 b217)
(on b134 b89)
(on b135 b234)
(on b136 b183)
(on b137 b11)
(on b138 b169)
(on b139 b196)
(on b140 b141)
(on b141 b41)
(on b142 b82)
(on b143 b151)
(on b144 b15)
(on b145 b240)
(on b146 b78)
(on b147 b40)
(on b148 b195)
(on b149 b212)
(on b150 b182)
(on b151 b23)
(on b152 b153)
(on b153 b192)
(on b154 b167)
(on b155 b163)
(on b156 b65)
(on b157 b90)
(on b158 b201)
(on b159 b12)
(on b160 b101)
(on b161 b135)
(on b162 b132)
(on b163 b39)
(on b164 b216)
(on b165 b134)
(on b166 b235)
(on b167 b176)
(on b168 b110)
(on-table b169)
(on b170 b31)
(on b171 b194)
(on b172 b158)
(on b173 b232)
(on b174 b117)
(on b175 b187)
(on b176 b205)
(on b177 b157)
(on b178 b119)
(on b179 b146)
(on b180 b138)
(on b181 b104)
(on b182 b9)
(on b183 b231)
(on b184 b1)
(on b185 b28)
(on-table b186)
(on b187 b34)
(on b188 b64)
(on b189 b30)
(on b190 b175)
(on b191 b199)
(on b192 b84)
(on-table b193)
(on b194 b190)
(on b195 b219)
(on b196 b180)
(on-table b197)
(on b198 b50)
(on b199 b221)
(on b200 b5)
(on b201 b13)
(on b202 b29)
(on b203 b108)
(on b204 b36)
(on b205 b239)
(on b206 b197)
(on b207 b150)
(on b208 b38)
(on b209 b21)
(on b210 b139)
(on b211 b225)
(on b212 b47)
(on b213 b14)
(on b214 b233)
(on b215 b107)
(on b216 b220)
(on b217 b26)
(on-table b218)
(on b219 b165)
(on b220 b166)
(on b221 b129)
(on b222 b207)
(on b223 b179)
(on b224 b22)
(on b225 b203)
(on b226 b211)
(on b227 b230)
(on b228 b54)
(on b229 b52)
(on b230 b93)
(on b231 b114)
(on b232 b77)
(on b233 b17)
(on b234 b71)
(on b235 b102)
(on b236 b43)
(on b237 b16)
(on b238 b123)
(on b239 b227)
(on b240 b173)
(on b241 b75)
(on b242 b130)
(on b243 b49)
(on b244 b35)
(on b245 b113)
(on b246 b86)
(clear b6)
(clear b60)
(clear b61)
(clear b63)
(clear b142)
(clear b144)
(clear b161)
(clear b174)
(clear b184)
(clear b193)
(clear b210)
(clear b213)
(clear b224)
(clear b228)
(clear b241)
(clear b246)
)
(:goal
(and
(on b1 b2))
)
)


