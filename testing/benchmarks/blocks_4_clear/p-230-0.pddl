

(define (problem BW-rand-230)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 b223 b224 b225 b226 b227 b228 b229 b230 )
(:init
(arm-empty)
(on b1 b131)
(on b2 b108)
(on b3 b153)
(on b4 b98)
(on b5 b201)
(on b6 b190)
(on b7 b79)
(on b8 b37)
(on b9 b107)
(on b10 b162)
(on b11 b95)
(on b12 b105)
(on b13 b84)
(on b14 b74)
(on b15 b193)
(on b16 b7)
(on b17 b8)
(on b18 b143)
(on b19 b205)
(on b20 b207)
(on b21 b166)
(on b22 b80)
(on b23 b86)
(on b24 b192)
(on b25 b225)
(on b26 b141)
(on b27 b136)
(on b28 b67)
(on b29 b93)
(on b30 b97)
(on b31 b92)
(on b32 b180)
(on b33 b172)
(on b34 b16)
(on b35 b13)
(on b36 b173)
(on b37 b70)
(on b38 b216)
(on b39 b168)
(on b40 b81)
(on b41 b181)
(on b42 b19)
(on b43 b65)
(on b44 b155)
(on b45 b152)
(on b46 b210)
(on b47 b14)
(on b48 b191)
(on b49 b124)
(on b50 b3)
(on b51 b142)
(on b52 b9)
(on b53 b57)
(on b54 b160)
(on b55 b21)
(on b56 b214)
(on b57 b46)
(on b58 b27)
(on b59 b45)
(on b60 b188)
(on b61 b163)
(on b62 b47)
(on b63 b161)
(on b64 b213)
(on b65 b36)
(on b66 b71)
(on b67 b34)
(on b68 b112)
(on-table b69)
(on b70 b6)
(on b71 b102)
(on b72 b60)
(on-table b73)
(on b74 b129)
(on-table b75)
(on b76 b111)
(on b77 b82)
(on b78 b178)
(on b79 b4)
(on b80 b198)
(on b81 b229)
(on b82 b219)
(on b83 b165)
(on b84 b75)
(on b85 b116)
(on b86 b96)
(on b87 b121)
(on b88 b53)
(on b89 b156)
(on b90 b221)
(on b91 b122)
(on b92 b87)
(on b93 b25)
(on b94 b128)
(on b95 b42)
(on b96 b10)
(on b97 b149)
(on b98 b202)
(on b99 b17)
(on b100 b133)
(on b101 b118)
(on b102 b49)
(on b103 b217)
(on-table b104)
(on b105 b182)
(on b106 b135)
(on b107 b59)
(on b108 b78)
(on b109 b117)
(on b110 b179)
(on b111 b109)
(on b112 b169)
(on b113 b43)
(on b114 b199)
(on b115 b32)
(on b116 b186)
(on b117 b224)
(on b118 b113)
(on b119 b26)
(on b120 b170)
(on b121 b212)
(on b122 b12)
(on b123 b215)
(on b124 b51)
(on b125 b226)
(on b126 b167)
(on b127 b88)
(on b128 b5)
(on-table b129)
(on b130 b150)
(on b131 b228)
(on b132 b83)
(on b133 b103)
(on b134 b125)
(on b135 b218)
(on b136 b29)
(on b137 b123)
(on b138 b94)
(on b139 b22)
(on b140 b33)
(on b141 b104)
(on b142 b211)
(on b143 b63)
(on b144 b73)
(on-table b145)
(on b146 b20)
(on b147 b220)
(on b148 b151)
(on b149 b223)
(on b150 b56)
(on b151 b11)
(on b152 b2)
(on b153 b62)
(on b154 b130)
(on b155 b72)
(on b156 b77)
(on b157 b195)
(on b158 b50)
(on b159 b68)
(on b160 b76)
(on b161 b58)
(on b162 b61)
(on b163 b28)
(on b164 b44)
(on b165 b41)
(on b166 b126)
(on-table b167)
(on b168 b15)
(on b169 b66)
(on b170 b209)
(on b171 b204)
(on-table b172)
(on b173 b115)
(on-table b174)
(on-table b175)
(on b176 b99)
(on b177 b106)
(on b178 b164)
(on b179 b35)
(on b180 b69)
(on b181 b54)
(on b182 b154)
(on-table b183)
(on b184 b148)
(on b185 b144)
(on b186 b197)
(on b187 b230)
(on-table b188)
(on b189 b147)
(on b190 b203)
(on b191 b110)
(on b192 b89)
(on b193 b48)
(on b194 b171)
(on b195 b90)
(on b196 b100)
(on b197 b196)
(on b198 b157)
(on b199 b18)
(on b200 b132)
(on b201 b127)
(on b202 b55)
(on b203 b158)
(on b204 b120)
(on b205 b146)
(on b206 b139)
(on b207 b39)
(on b208 b119)
(on b209 b183)
(on b210 b1)
(on b211 b208)
(on b212 b91)
(on b213 b189)
(on b214 b184)
(on b215 b52)
(on b216 b64)
(on b217 b134)
(on b218 b206)
(on b219 b177)
(on b220 b159)
(on b221 b31)
(on b222 b174)
(on b223 b227)
(on b224 b194)
(on b225 b85)
(on b226 b137)
(on-table b227)
(on b228 b114)
(on b229 b23)
(on b230 b30)
(clear b24)
(clear b38)
(clear b40)
(clear b101)
(clear b138)
(clear b140)
(clear b145)
(clear b175)
(clear b176)
(clear b185)
(clear b187)
(clear b200)
(clear b222)
)
(:goal
(and
(clear b1))
)
)


