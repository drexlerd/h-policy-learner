

(define (problem BW-rand-252)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 b225 b226 b227 b228 b229 b230 b231 b232 b233 b234 b235 b236 b237 b238 b239 b240 b241 b242 b243 b244 b245 b246 b247 b248 b249 b250 b251 b252 )
(:init
(arm-empty)
(on b1 b175)
(on b2 b166)
(on-table b3)
(on b4 b10)
(on b5 b96)
(on b6 b187)
(on b7 b218)
(on b8 b23)
(on b9 b67)
(on b10 b81)
(on b11 b22)
(on b12 b219)
(on b13 b200)
(on b14 b176)
(on b15 b202)
(on b16 b150)
(on b17 b188)
(on b18 b31)
(on b19 b213)
(on b20 b93)
(on b21 b120)
(on b22 b114)
(on b23 b130)
(on b24 b4)
(on b25 b222)
(on b26 b173)
(on b27 b77)
(on b28 b85)
(on b29 b184)
(on b30 b143)
(on-table b31)
(on b32 b190)
(on-table b33)
(on b34 b127)
(on b35 b33)
(on b36 b145)
(on b37 b149)
(on b38 b116)
(on b39 b226)
(on b40 b18)
(on b41 b129)
(on b42 b101)
(on b43 b171)
(on b44 b110)
(on b45 b208)
(on-table b46)
(on b47 b205)
(on b48 b68)
(on b49 b140)
(on b50 b27)
(on b51 b2)
(on b52 b233)
(on b53 b73)
(on b54 b94)
(on-table b55)
(on b56 b45)
(on b57 b121)
(on b58 b153)
(on b59 b6)
(on-table b60)
(on b61 b148)
(on b62 b9)
(on b63 b59)
(on b64 b43)
(on b65 b246)
(on b66 b32)
(on b67 b221)
(on b68 b84)
(on b69 b135)
(on b70 b242)
(on b71 b21)
(on b72 b217)
(on b73 b51)
(on b74 b131)
(on b75 b106)
(on b76 b38)
(on b77 b191)
(on b78 b115)
(on b79 b87)
(on b80 b198)
(on b81 b99)
(on b82 b1)
(on b83 b108)
(on b84 b7)
(on b85 b35)
(on b86 b8)
(on b87 b215)
(on b88 b5)
(on b89 b57)
(on b90 b196)
(on b91 b170)
(on b92 b48)
(on b93 b197)
(on b94 b250)
(on b95 b209)
(on b96 b240)
(on b97 b39)
(on b98 b227)
(on b99 b50)
(on b100 b42)
(on b101 b83)
(on b102 b64)
(on b103 b28)
(on b104 b199)
(on b105 b206)
(on b106 b17)
(on b107 b82)
(on b108 b163)
(on b109 b251)
(on b110 b155)
(on b111 b126)
(on b112 b165)
(on b113 b123)
(on b114 b223)
(on-table b115)
(on b116 b167)
(on b117 b54)
(on b118 b15)
(on b119 b65)
(on b120 b46)
(on b121 b181)
(on-table b122)
(on b123 b159)
(on b124 b98)
(on b125 b169)
(on b126 b204)
(on b127 b151)
(on b128 b103)
(on b129 b71)
(on b130 b88)
(on b131 b172)
(on b132 b211)
(on b133 b244)
(on b134 b119)
(on b135 b252)
(on b136 b92)
(on b137 b102)
(on b138 b243)
(on b139 b193)
(on b140 b62)
(on b141 b189)
(on b142 b89)
(on b143 b235)
(on b144 b37)
(on b145 b229)
(on b146 b174)
(on b147 b112)
(on b148 b177)
(on b149 b47)
(on b150 b75)
(on b151 b16)
(on b152 b12)
(on b153 b69)
(on b154 b107)
(on b155 b14)
(on b156 b95)
(on b157 b160)
(on b158 b186)
(on b159 b122)
(on b160 b245)
(on b161 b154)
(on b162 b111)
(on b163 b164)
(on b164 b139)
(on b165 b238)
(on b166 b234)
(on-table b167)
(on b168 b178)
(on-table b169)
(on b170 b80)
(on b171 b25)
(on b172 b104)
(on b173 b137)
(on b174 b179)
(on-table b175)
(on b176 b249)
(on b177 b180)
(on b178 b210)
(on b179 b49)
(on b180 b216)
(on b181 b214)
(on b182 b97)
(on b183 b239)
(on b184 b134)
(on b185 b109)
(on b186 b78)
(on b187 b158)
(on b188 b212)
(on b189 b146)
(on b190 b156)
(on b191 b34)
(on b192 b168)
(on b193 b86)
(on b194 b56)
(on b195 b36)
(on-table b196)
(on b197 b185)
(on b198 b3)
(on b199 b220)
(on b200 b203)
(on b201 b55)
(on b202 b124)
(on b203 b162)
(on b204 b224)
(on b205 b248)
(on b206 b195)
(on b207 b125)
(on b208 b192)
(on b209 b225)
(on b210 b24)
(on b211 b13)
(on b212 b63)
(on b213 b20)
(on b214 b19)
(on b215 b147)
(on b216 b53)
(on b217 b58)
(on b218 b152)
(on b219 b29)
(on b220 b207)
(on b221 b182)
(on b222 b90)
(on b223 b144)
(on b224 b91)
(on b225 b60)
(on b226 b183)
(on b227 b70)
(on b228 b40)
(on b229 b237)
(on b230 b142)
(on-table b231)
(on b232 b230)
(on b233 b66)
(on b234 b194)
(on b235 b44)
(on-table b236)
(on b237 b11)
(on b238 b117)
(on b239 b241)
(on b240 b228)
(on b241 b74)
(on b242 b157)
(on-table b243)
(on b244 b136)
(on b245 b236)
(on-table b246)
(on b247 b61)
(on b248 b118)
(on b249 b201)
(on b250 b105)
(on b251 b247)
(on b252 b232)
(clear b26)
(clear b30)
(clear b41)
(clear b52)
(clear b72)
(clear b76)
(clear b79)
(clear b100)
(clear b113)
(clear b128)
(clear b132)
(clear b133)
(clear b138)
(clear b141)
(clear b161)
(clear b231)
)
(:goal
(and
(clear b1))
)
)


