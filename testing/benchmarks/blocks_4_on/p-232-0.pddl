

(define (problem BW-rand-232)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 b225 b226 b227 b228 b229 b230 b231 b232 )
(:init
(arm-empty)
(on b1 b116)
(on b2 b45)
(on b3 b89)
(on b4 b75)
(on b5 b161)
(on b6 b13)
(on b7 b148)
(on b8 b111)
(on b9 b187)
(on-table b10)
(on b11 b219)
(on b12 b193)
(on b13 b67)
(on b14 b59)
(on b15 b78)
(on b16 b62)
(on b17 b157)
(on b18 b132)
(on b19 b159)
(on b20 b186)
(on b21 b200)
(on b22 b68)
(on b23 b79)
(on b24 b167)
(on b25 b163)
(on b26 b225)
(on b27 b222)
(on b28 b214)
(on b29 b160)
(on b30 b174)
(on b31 b208)
(on b32 b117)
(on b33 b182)
(on b34 b84)
(on b35 b215)
(on b36 b41)
(on b37 b153)
(on b38 b138)
(on b39 b48)
(on b40 b156)
(on b41 b126)
(on b42 b135)
(on b43 b71)
(on b44 b30)
(on b45 b8)
(on b46 b54)
(on b47 b183)
(on b48 b231)
(on b49 b82)
(on b50 b128)
(on b51 b199)
(on b52 b213)
(on b53 b149)
(on b54 b104)
(on b55 b197)
(on b56 b221)
(on b57 b195)
(on b58 b44)
(on b59 b154)
(on b60 b24)
(on b61 b33)
(on b62 b31)
(on b63 b90)
(on b64 b47)
(on b65 b158)
(on b66 b58)
(on b67 b168)
(on b68 b177)
(on b69 b209)
(on b70 b5)
(on b71 b114)
(on b72 b170)
(on b73 b22)
(on b74 b37)
(on b75 b105)
(on b76 b14)
(on b77 b129)
(on b78 b97)
(on b79 b124)
(on-table b80)
(on b81 b202)
(on b82 b119)
(on b83 b220)
(on b84 b125)
(on b85 b56)
(on b86 b76)
(on b87 b122)
(on-table b88)
(on b89 b142)
(on b90 b232)
(on b91 b147)
(on b92 b80)
(on b93 b172)
(on b94 b23)
(on b95 b133)
(on b96 b101)
(on b97 b181)
(on b98 b61)
(on b99 b96)
(on b100 b16)
(on b101 b189)
(on b102 b12)
(on b103 b140)
(on b104 b63)
(on b105 b145)
(on b106 b176)
(on-table b107)
(on b108 b194)
(on b109 b17)
(on b110 b175)
(on b111 b229)
(on b112 b107)
(on b113 b196)
(on b114 b81)
(on b115 b53)
(on b116 b169)
(on b117 b103)
(on b118 b95)
(on b119 b100)
(on b120 b28)
(on b121 b141)
(on b122 b91)
(on-table b123)
(on b124 b35)
(on b125 b162)
(on b126 b92)
(on b127 b113)
(on b128 b137)
(on b129 b224)
(on b130 b136)
(on b131 b108)
(on b132 b87)
(on b133 b46)
(on b134 b52)
(on-table b135)
(on b136 b165)
(on b137 b32)
(on b138 b109)
(on b139 b144)
(on b140 b21)
(on b141 b178)
(on b142 b223)
(on b143 b123)
(on b144 b51)
(on b145 b2)
(on b146 b74)
(on b147 b70)
(on b148 b38)
(on b149 b164)
(on b150 b42)
(on b151 b106)
(on b152 b130)
(on b153 b112)
(on b154 b143)
(on b155 b55)
(on b156 b88)
(on b157 b192)
(on b158 b110)
(on b159 b216)
(on b160 b139)
(on b161 b34)
(on b162 b166)
(on b163 b151)
(on b164 b1)
(on-table b165)
(on b166 b115)
(on b167 b27)
(on b168 b226)
(on b169 b203)
(on b170 b9)
(on b171 b49)
(on b172 b204)
(on b173 b131)
(on b174 b155)
(on b175 b179)
(on b176 b134)
(on b177 b190)
(on b178 b185)
(on-table b179)
(on b180 b36)
(on b181 b19)
(on b182 b26)
(on b183 b206)
(on b184 b66)
(on-table b185)
(on b186 b72)
(on b187 b10)
(on b188 b29)
(on b189 b171)
(on b190 b184)
(on b191 b218)
(on b192 b150)
(on b193 b99)
(on b194 b6)
(on-table b195)
(on b196 b98)
(on-table b197)
(on b198 b205)
(on b199 b3)
(on b200 b227)
(on b201 b65)
(on b202 b121)
(on b203 b86)
(on b204 b188)
(on b205 b85)
(on b206 b94)
(on b207 b120)
(on-table b208)
(on b209 b127)
(on b210 b191)
(on b211 b40)
(on b212 b39)
(on b213 b173)
(on-table b214)
(on b215 b77)
(on b216 b198)
(on b217 b93)
(on b218 b180)
(on b219 b18)
(on b220 b211)
(on b221 b50)
(on b222 b152)
(on b223 b43)
(on b224 b201)
(on b225 b57)
(on b226 b15)
(on b227 b102)
(on b228 b230)
(on b229 b210)
(on b230 b20)
(on b231 b207)
(on b232 b7)
(clear b4)
(clear b11)
(clear b25)
(clear b60)
(clear b64)
(clear b69)
(clear b73)
(clear b83)
(clear b118)
(clear b146)
(clear b212)
(clear b217)
(clear b228)
)
(:goal
(and
(on b1 b2))
)
)


