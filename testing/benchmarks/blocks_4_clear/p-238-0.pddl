

(define (problem BW-rand-238)
(:domain blocksworld)
(:objects b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 b225 b226 b227 b228 b229 b230 b231 b232 b233 b234 b235 b236 b237 b238 )
(:init
(arm-empty)
(on b1 b91)
(on b2 b155)
(on b3 b4)
(on b4 b38)
(on b5 b220)
(on b6 b94)
(on b7 b9)
(on b8 b104)
(on b9 b182)
(on b10 b146)
(on b11 b43)
(on b12 b171)
(on b13 b126)
(on b14 b44)
(on b15 b151)
(on b16 b180)
(on b17 b66)
(on b18 b102)
(on b19 b234)
(on b20 b188)
(on b21 b109)
(on b22 b205)
(on b23 b6)
(on b24 b118)
(on b25 b36)
(on b26 b37)
(on b27 b92)
(on b28 b88)
(on b29 b2)
(on b30 b13)
(on b31 b191)
(on b32 b93)
(on b33 b62)
(on b34 b157)
(on-table b35)
(on-table b36)
(on b37 b1)
(on b38 b154)
(on b39 b87)
(on b40 b46)
(on b41 b29)
(on b42 b199)
(on b43 b124)
(on b44 b230)
(on b45 b179)
(on b46 b140)
(on b47 b168)
(on b48 b30)
(on b49 b54)
(on b50 b198)
(on b51 b117)
(on b52 b237)
(on b53 b82)
(on b54 b147)
(on b55 b212)
(on-table b56)
(on b57 b203)
(on b58 b153)
(on b59 b225)
(on b60 b7)
(on b61 b166)
(on b62 b176)
(on-table b63)
(on b64 b77)
(on b65 b143)
(on b66 b105)
(on b67 b128)
(on b68 b138)
(on b69 b222)
(on b70 b190)
(on b71 b76)
(on b72 b75)
(on b73 b136)
(on b74 b137)
(on b75 b86)
(on b76 b226)
(on b77 b144)
(on b78 b127)
(on b79 b145)
(on b80 b167)
(on b81 b139)
(on-table b82)
(on b83 b95)
(on b84 b59)
(on b85 b231)
(on b86 b200)
(on b87 b187)
(on b88 b32)
(on b89 b20)
(on b90 b125)
(on b91 b201)
(on b92 b160)
(on b93 b39)
(on b94 b60)
(on b95 b206)
(on b96 b111)
(on b97 b142)
(on b98 b8)
(on b99 b89)
(on b100 b52)
(on b101 b48)
(on b102 b227)
(on b103 b161)
(on b104 b72)
(on b105 b148)
(on b106 b159)
(on b107 b71)
(on b108 b173)
(on b109 b133)
(on b110 b73)
(on b111 b100)
(on b112 b209)
(on b113 b69)
(on b114 b207)
(on b115 b218)
(on b116 b177)
(on b117 b174)
(on b118 b35)
(on b119 b97)
(on b120 b24)
(on b121 b61)
(on b122 b185)
(on b123 b214)
(on b124 b216)
(on b125 b58)
(on b126 b99)
(on b127 b195)
(on b128 b65)
(on b129 b96)
(on-table b130)
(on b131 b12)
(on b132 b26)
(on b133 b131)
(on b134 b197)
(on b135 b115)
(on b136 b163)
(on b137 b56)
(on b138 b232)
(on b139 b51)
(on b140 b110)
(on b141 b101)
(on b142 b192)
(on b143 b31)
(on b144 b129)
(on b145 b158)
(on b146 b80)
(on b147 b70)
(on b148 b34)
(on-table b149)
(on b150 b221)
(on b151 b236)
(on b152 b11)
(on b153 b156)
(on b154 b21)
(on b155 b170)
(on-table b156)
(on b157 b64)
(on b158 b165)
(on b159 b122)
(on b160 b19)
(on b161 b47)
(on b162 b181)
(on b163 b5)
(on b164 b22)
(on b165 b149)
(on b166 b132)
(on b167 b208)
(on b168 b10)
(on-table b169)
(on b170 b25)
(on b171 b235)
(on b172 b108)
(on b173 b16)
(on b174 b40)
(on b175 b169)
(on b176 b202)
(on b177 b68)
(on b178 b103)
(on b179 b106)
(on b180 b42)
(on b181 b98)
(on b182 b84)
(on b183 b152)
(on b184 b49)
(on b185 b123)
(on b186 b210)
(on b187 b172)
(on b188 b78)
(on-table b189)
(on b190 b74)
(on-table b191)
(on b192 b17)
(on b193 b67)
(on b194 b83)
(on-table b195)
(on b196 b164)
(on b197 b120)
(on b198 b113)
(on b199 b196)
(on b200 b15)
(on b201 b229)
(on b202 b219)
(on-table b203)
(on b204 b90)
(on b205 b204)
(on b206 b130)
(on b207 b224)
(on b208 b116)
(on b209 b28)
(on b210 b18)
(on b211 b121)
(on b212 b14)
(on b213 b53)
(on b214 b107)
(on b215 b81)
(on b216 b33)
(on b217 b57)
(on b218 b189)
(on b219 b223)
(on b220 b79)
(on b221 b45)
(on b222 b150)
(on b223 b184)
(on b224 b175)
(on b225 b85)
(on b226 b217)
(on b227 b141)
(on b228 b238)
(on b229 b162)
(on b230 b50)
(on b231 b186)
(on b232 b183)
(on b233 b134)
(on b234 b63)
(on b235 b112)
(on b236 b194)
(on b237 b41)
(on-table b238)
(clear b3)
(clear b23)
(clear b27)
(clear b55)
(clear b114)
(clear b119)
(clear b135)
(clear b178)
(clear b193)
(clear b211)
(clear b213)
(clear b215)
(clear b228)
(clear b233)
)
(:goal
(and
(clear b1))
)
)


