

(define (problem BW-rand-236)
(:domain blocksworld)
(:objects b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 b225 b226 b227 b228 b229 b230 b231 b232 b233 b234 b235 b236 )
(:init
(arm-empty)
(on b1 b3)
(on-table b2)
(on b3 b85)
(on b4 b38)
(on b5 b220)
(on b6 b127)
(on b7 b121)
(on b8 b28)
(on b9 b136)
(on b10 b157)
(on b11 b46)
(on b12 b188)
(on b13 b195)
(on b14 b146)
(on b15 b224)
(on b16 b184)
(on b17 b76)
(on b18 b190)
(on b19 b203)
(on b20 b77)
(on b21 b70)
(on b22 b14)
(on b23 b137)
(on b24 b107)
(on b25 b61)
(on b26 b153)
(on b27 b12)
(on b28 b236)
(on b29 b213)
(on b30 b44)
(on b31 b20)
(on b32 b199)
(on b33 b202)
(on b34 b167)
(on b35 b74)
(on b36 b147)
(on b37 b145)
(on b38 b13)
(on b39 b6)
(on b40 b16)
(on b41 b183)
(on b42 b140)
(on b43 b171)
(on b44 b217)
(on b45 b68)
(on b46 b179)
(on b47 b89)
(on b48 b149)
(on b49 b84)
(on b50 b116)
(on b51 b36)
(on b52 b219)
(on b53 b132)
(on b54 b102)
(on b55 b182)
(on b56 b214)
(on b57 b150)
(on b58 b118)
(on-table b59)
(on b60 b138)
(on b61 b23)
(on b62 b164)
(on b63 b41)
(on b64 b72)
(on b65 b24)
(on b66 b151)
(on b67 b231)
(on b68 b111)
(on b69 b58)
(on b70 b168)
(on b71 b50)
(on b72 b48)
(on b73 b10)
(on b74 b123)
(on b75 b54)
(on b76 b8)
(on b77 b119)
(on b78 b155)
(on b79 b56)
(on b80 b158)
(on b81 b33)
(on b82 b172)
(on b83 b187)
(on b84 b221)
(on b85 b9)
(on b86 b141)
(on b87 b114)
(on b88 b32)
(on b89 b80)
(on b90 b18)
(on-table b91)
(on b92 b64)
(on b93 b207)
(on b94 b159)
(on b95 b42)
(on b96 b162)
(on-table b97)
(on b98 b30)
(on b99 b148)
(on b100 b193)
(on b101 b79)
(on b102 b133)
(on b103 b117)
(on b104 b75)
(on b105 b7)
(on b106 b185)
(on b107 b189)
(on b108 b230)
(on b109 b233)
(on b110 b135)
(on b111 b37)
(on b112 b122)
(on b113 b4)
(on-table b114)
(on b115 b196)
(on b116 b35)
(on b117 b67)
(on b118 b208)
(on b119 b143)
(on b120 b194)
(on b121 b152)
(on b122 b81)
(on b123 b176)
(on b124 b71)
(on-table b125)
(on b126 b69)
(on b127 b53)
(on b128 b228)
(on b129 b142)
(on b130 b126)
(on b131 b178)
(on b132 b45)
(on b133 b15)
(on b134 b11)
(on b135 b87)
(on b136 b78)
(on b137 b234)
(on b138 b154)
(on b139 b175)
(on b140 b209)
(on b141 b21)
(on b142 b31)
(on b143 b227)
(on b144 b204)
(on b145 b169)
(on b146 b129)
(on b147 b201)
(on b148 b88)
(on-table b149)
(on b150 b144)
(on b151 b55)
(on b152 b197)
(on b153 b65)
(on b154 b186)
(on b155 b165)
(on b156 b98)
(on b157 b215)
(on b158 b49)
(on b159 b34)
(on b160 b47)
(on b161 b115)
(on b162 b210)
(on b163 b25)
(on b164 b17)
(on b165 b86)
(on b166 b101)
(on-table b167)
(on b168 b52)
(on b169 b156)
(on b170 b166)
(on b171 b229)
(on b172 b139)
(on b173 b192)
(on b174 b96)
(on b175 b1)
(on b176 b62)
(on b177 b83)
(on b178 b160)
(on b179 b128)
(on b180 b2)
(on b181 b112)
(on b182 b104)
(on b183 b200)
(on b184 b63)
(on b185 b163)
(on b186 b216)
(on b187 b39)
(on b188 b73)
(on b189 b105)
(on b190 b60)
(on-table b191)
(on b192 b174)
(on b193 b181)
(on b194 b205)
(on b195 b180)
(on b196 b198)
(on b197 b211)
(on b198 b82)
(on b199 b113)
(on-table b200)
(on b201 b5)
(on b202 b226)
(on b203 b108)
(on b204 b206)
(on b205 b131)
(on b206 b97)
(on b207 b103)
(on b208 b232)
(on b209 b59)
(on b210 b235)
(on b211 b222)
(on b212 b66)
(on b213 b95)
(on b214 b94)
(on b215 b109)
(on b216 b170)
(on b217 b43)
(on b218 b134)
(on b219 b100)
(on b220 b223)
(on-table b221)
(on b222 b161)
(on b223 b225)
(on b224 b19)
(on b225 b90)
(on b226 b22)
(on b227 b173)
(on b228 b120)
(on b229 b124)
(on b230 b125)
(on b231 b130)
(on b232 b91)
(on b233 b51)
(on b234 b57)
(on-table b235)
(on b236 b191)
(clear b26)
(clear b27)
(clear b29)
(clear b40)
(clear b92)
(clear b93)
(clear b99)
(clear b106)
(clear b110)
(clear b177)
(clear b212)
(clear b218)
)
(:goal
(and
(on b1 b2))
)
)


