

(define (problem BW-rand-238)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 b225 b226 b227 b228 b229 b230 b231 b232 b233 b234 b235 b236 b237 b238 )
(:init
(arm-empty)
(on b1 b140)
(on b2 b133)
(on b3 b159)
(on b4 b169)
(on b5 b206)
(on b6 b235)
(on b7 b13)
(on-table b8)
(on b9 b202)
(on b10 b57)
(on b11 b42)
(on b12 b29)
(on b13 b101)
(on b14 b104)
(on b15 b131)
(on-table b16)
(on b17 b31)
(on b18 b2)
(on b19 b47)
(on b20 b59)
(on b21 b209)
(on b22 b100)
(on b23 b67)
(on b24 b230)
(on b25 b19)
(on b26 b165)
(on b27 b15)
(on b28 b163)
(on-table b29)
(on b30 b124)
(on b31 b69)
(on b32 b77)
(on b33 b215)
(on b34 b107)
(on b35 b82)
(on b36 b190)
(on b37 b27)
(on b38 b22)
(on b39 b129)
(on b40 b80)
(on b41 b184)
(on b42 b83)
(on b43 b225)
(on b44 b123)
(on b45 b141)
(on b46 b162)
(on b47 b40)
(on b48 b134)
(on b49 b63)
(on b50 b127)
(on b51 b33)
(on b52 b210)
(on b53 b37)
(on b54 b231)
(on b55 b95)
(on b56 b98)
(on b57 b16)
(on b58 b122)
(on b59 b87)
(on b60 b150)
(on b61 b222)
(on b62 b177)
(on b63 b144)
(on b64 b20)
(on b65 b138)
(on b66 b179)
(on b67 b201)
(on b68 b85)
(on b69 b119)
(on b70 b207)
(on b71 b223)
(on b72 b224)
(on b73 b115)
(on b74 b232)
(on b75 b155)
(on b76 b142)
(on b77 b73)
(on b78 b39)
(on b79 b50)
(on b80 b205)
(on b81 b55)
(on b82 b106)
(on b83 b17)
(on b84 b218)
(on b85 b176)
(on b86 b93)
(on b87 b74)
(on b88 b18)
(on b89 b204)
(on b90 b167)
(on b91 b4)
(on b92 b198)
(on b93 b44)
(on b94 b157)
(on b95 b192)
(on b96 b182)
(on b97 b148)
(on b98 b43)
(on b99 b62)
(on b100 b121)
(on b101 b6)
(on b102 b187)
(on b103 b203)
(on-table b104)
(on b105 b24)
(on-table b106)
(on b107 b186)
(on b108 b91)
(on b109 b174)
(on b110 b45)
(on b111 b90)
(on b112 b130)
(on b113 b60)
(on b114 b136)
(on b115 b51)
(on b116 b158)
(on b117 b26)
(on b118 b41)
(on b119 b46)
(on b120 b166)
(on b121 b118)
(on b122 b103)
(on b123 b14)
(on b124 b79)
(on-table b125)
(on b126 b125)
(on b127 b180)
(on b128 b65)
(on b129 b114)
(on b130 b200)
(on b131 b64)
(on b132 b227)
(on b133 b194)
(on b134 b8)
(on b135 b161)
(on b136 b196)
(on b137 b128)
(on-table b138)
(on b139 b234)
(on b140 b221)
(on b141 b48)
(on b142 b185)
(on b143 b72)
(on b144 b110)
(on b145 b86)
(on b146 b35)
(on b147 b116)
(on b148 b49)
(on b149 b7)
(on b150 b99)
(on b151 b10)
(on b152 b228)
(on b153 b199)
(on b154 b135)
(on b155 b108)
(on b156 b12)
(on b157 b5)
(on b158 b38)
(on b159 b217)
(on b160 b36)
(on b161 b220)
(on b162 b195)
(on b163 b78)
(on b164 b137)
(on-table b165)
(on b166 b212)
(on b167 b175)
(on b168 b214)
(on b169 b58)
(on b170 b160)
(on b171 b191)
(on b172 b68)
(on b173 b113)
(on b174 b208)
(on b175 b28)
(on b176 b109)
(on b177 b75)
(on b178 b11)
(on b179 b188)
(on b180 b178)
(on b181 b88)
(on b182 b97)
(on b183 b219)
(on b184 b236)
(on b185 b229)
(on b186 b171)
(on-table b187)
(on-table b188)
(on b189 b139)
(on b190 b71)
(on b191 b149)
(on b192 b164)
(on b193 b54)
(on b194 b76)
(on b195 b117)
(on b196 b226)
(on b197 b193)
(on-table b198)
(on b199 b1)
(on b200 b173)
(on b201 b132)
(on b202 b181)
(on b203 b152)
(on b204 b81)
(on b205 b66)
(on b206 b211)
(on b207 b89)
(on b208 b111)
(on b209 b170)
(on b210 b216)
(on b211 b34)
(on b212 b21)
(on b213 b189)
(on b214 b233)
(on b215 b52)
(on-table b216)
(on b217 b112)
(on-table b218)
(on b219 b168)
(on b220 b96)
(on b221 b30)
(on b222 b147)
(on b223 b23)
(on b224 b3)
(on b225 b154)
(on b226 b70)
(on b227 b61)
(on b228 b102)
(on b229 b32)
(on b230 b145)
(on b231 b9)
(on b232 b126)
(on b233 b237)
(on b234 b197)
(on b235 b172)
(on b236 b53)
(on b237 b238)
(on b238 b151)
(clear b25)
(clear b56)
(clear b84)
(clear b92)
(clear b94)
(clear b105)
(clear b120)
(clear b143)
(clear b146)
(clear b153)
(clear b156)
(clear b183)
(clear b213)
)
(:goal
(and
(clear b1))
)
)


