

(define (problem BW-rand-222)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 b221 b222 )
(:init
(arm-empty)
(on b1 b148)
(on b2 b134)
(on b3 b129)
(on b4 b111)
(on b5 b199)
(on b6 b1)
(on b7 b67)
(on b8 b58)
(on b9 b70)
(on b10 b56)
(on b11 b96)
(on b12 b41)
(on b13 b87)
(on b14 b186)
(on b15 b7)
(on b16 b165)
(on b17 b210)
(on b18 b60)
(on b19 b147)
(on b20 b6)
(on b21 b33)
(on b22 b16)
(on b23 b22)
(on b24 b206)
(on b25 b17)
(on b26 b153)
(on b27 b121)
(on b28 b139)
(on b29 b119)
(on b30 b9)
(on b31 b18)
(on b32 b192)
(on b33 b187)
(on b34 b191)
(on b35 b218)
(on b36 b53)
(on b37 b162)
(on b38 b104)
(on b39 b189)
(on b40 b95)
(on b41 b217)
(on b42 b64)
(on b43 b48)
(on b44 b175)
(on b45 b65)
(on b46 b8)
(on b47 b221)
(on b48 b105)
(on b49 b109)
(on b50 b113)
(on b51 b132)
(on b52 b90)
(on b53 b27)
(on b54 b49)
(on b55 b21)
(on b56 b156)
(on b57 b184)
(on b58 b25)
(on b59 b103)
(on b60 b55)
(on b61 b120)
(on b62 b141)
(on b63 b82)
(on b64 b195)
(on b65 b13)
(on b66 b181)
(on b67 b151)
(on b68 b171)
(on b69 b75)
(on b70 b61)
(on b71 b106)
(on b72 b136)
(on b73 b193)
(on b74 b150)
(on b75 b145)
(on-table b76)
(on b77 b172)
(on b78 b205)
(on-table b79)
(on b80 b140)
(on b81 b122)
(on b82 b128)
(on b83 b59)
(on b84 b23)
(on b85 b112)
(on-table b86)
(on b87 b62)
(on b88 b174)
(on-table b89)
(on b90 b99)
(on b91 b219)
(on b92 b164)
(on b93 b110)
(on b94 b190)
(on-table b95)
(on b96 b28)
(on b97 b44)
(on b98 b208)
(on b99 b177)
(on-table b100)
(on b101 b214)
(on b102 b123)
(on b103 b24)
(on b104 b201)
(on b105 b212)
(on b106 b166)
(on b107 b34)
(on b108 b54)
(on b109 b197)
(on b110 b83)
(on b111 b159)
(on b112 b154)
(on b113 b173)
(on b114 b15)
(on-table b115)
(on b116 b100)
(on b117 b143)
(on b118 b216)
(on b119 b14)
(on b120 b46)
(on b121 b19)
(on b122 b178)
(on b123 b204)
(on b124 b130)
(on b125 b202)
(on b126 b81)
(on b127 b133)
(on b128 b115)
(on b129 b69)
(on b130 b63)
(on b131 b72)
(on b132 b157)
(on b133 b74)
(on b134 b179)
(on b135 b12)
(on b136 b43)
(on b137 b77)
(on-table b138)
(on b139 b40)
(on b140 b92)
(on b141 b168)
(on b142 b91)
(on b143 b149)
(on b144 b73)
(on b145 b126)
(on b146 b76)
(on b147 b30)
(on b148 b98)
(on b149 b220)
(on b150 b26)
(on b151 b135)
(on b152 b116)
(on b153 b146)
(on b154 b11)
(on b155 b5)
(on b156 b198)
(on b157 b182)
(on b158 b94)
(on b159 b188)
(on b160 b144)
(on b161 b10)
(on b162 b42)
(on b163 b80)
(on b164 b158)
(on b165 b155)
(on b166 b194)
(on b167 b142)
(on b168 b114)
(on b169 b163)
(on b170 b127)
(on b171 b31)
(on b172 b207)
(on b173 b125)
(on b174 b176)
(on b175 b137)
(on-table b176)
(on b177 b47)
(on b178 b89)
(on b179 b101)
(on b180 b161)
(on b181 b160)
(on b182 b124)
(on b183 b117)
(on b184 b118)
(on b185 b4)
(on b186 b88)
(on b187 b57)
(on b188 b35)
(on b189 b185)
(on b190 b29)
(on b191 b52)
(on b192 b39)
(on b193 b209)
(on b194 b170)
(on b195 b45)
(on b196 b131)
(on b197 b37)
(on-table b198)
(on b199 b107)
(on b200 b68)
(on b201 b86)
(on b202 b213)
(on b203 b71)
(on-table b204)
(on-table b205)
(on b206 b200)
(on b207 b85)
(on b208 b203)
(on b209 b38)
(on b210 b20)
(on b211 b66)
(on-table b212)
(on b213 b79)
(on b214 b78)
(on b215 b84)
(on b216 b211)
(on b217 b183)
(on-table b218)
(on b219 b3)
(on b220 b51)
(on b221 b138)
(on-table b222)
(clear b2)
(clear b32)
(clear b36)
(clear b50)
(clear b93)
(clear b97)
(clear b102)
(clear b108)
(clear b152)
(clear b167)
(clear b169)
(clear b180)
(clear b196)
(clear b215)
(clear b222)
)
(:goal
(and
(on b1 b2))
)
)


