

(define (problem BW-rand-220)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 b21 b22 b23 b24 b25 b26 b27 b28 b29 b30 b31 b32 b33 b34 b35 b36 b37 b38 b39 b40 b41 b42 b43 b44 b45 b46 b47 b48 b49 b50 b51 b52 b53 b54 b55 b56 b57 b58 b59 b60 b61 b62 b63 b64 b65 b66 b67 b68 b69 b70 b71 b72 b73 b74 b75 b76 b77 b78 b79 b80 b81 b82 b83 b84 b85 b86 b87 b88 b89 b90 b91 b92 b93 b94 b95 b96 b97 b98 b99 b100 b101 b102 b103 b104 b105 b106 b107 b108 b109 b110 b111 b112 b113 b114 b115 b116 b117 b118 b119 b120 b121 b122 b123 b124 b125 b126 b127 b128 b129 b130 b131 b132 b133 b134 b135 b136 b137 b138 b139 b140 b141 b142 b143 b144 b145 b146 b147 b148 b149 b150 b151 b152 b153 b154 b155 b156 b157 b158 b159 b160 b161 b162 b163 b164 b165 b166 b167 b168 b169 b170 b171 b172 b173 b174 b175 b176 b177 b178 b179 b180 b181 b182 b183 b184 b185 b186 b187 b188 b189 b190 b191 b192 b193 b194 b195 b196 b197 b198 b199 b200 b201 b202 b203 b204 b205 b206 b207 b208 b209 b210 b211 b212 b213 b214 b215 b216 b217 b218 b219 b220 )
(:init
(arm-empty)
(on b1 b72)
(on b2 b155)
(on b3 b156)
(on b4 b157)
(on b5 b153)
(on b6 b136)
(on b7 b212)
(on b8 b133)
(on b9 b2)
(on b10 b195)
(on b11 b100)
(on b12 b170)
(on b13 b149)
(on b14 b26)
(on-table b15)
(on b16 b198)
(on-table b17)
(on b18 b69)
(on b19 b77)
(on b20 b56)
(on b21 b80)
(on b22 b70)
(on b23 b181)
(on b24 b68)
(on b25 b57)
(on b26 b205)
(on b27 b123)
(on b28 b138)
(on b29 b51)
(on b30 b211)
(on b31 b74)
(on-table b32)
(on b33 b116)
(on b34 b185)
(on b35 b81)
(on b36 b42)
(on b37 b55)
(on b38 b213)
(on b39 b92)
(on b40 b143)
(on b41 b93)
(on b42 b152)
(on-table b43)
(on b44 b219)
(on b45 b144)
(on b46 b124)
(on b47 b131)
(on b48 b45)
(on b49 b24)
(on b50 b14)
(on b51 b171)
(on-table b52)
(on b53 b90)
(on b54 b32)
(on b55 b189)
(on-table b56)
(on b57 b53)
(on b58 b108)
(on b59 b47)
(on b60 b66)
(on-table b61)
(on b62 b139)
(on b63 b132)
(on b64 b140)
(on b65 b84)
(on b66 b169)
(on-table b67)
(on b68 b146)
(on-table b69)
(on b70 b134)
(on b71 b67)
(on b72 b73)
(on b73 b166)
(on b74 b204)
(on b75 b191)
(on b76 b208)
(on b77 b129)
(on b78 b5)
(on b79 b135)
(on b80 b217)
(on b81 b29)
(on b82 b15)
(on b83 b49)
(on b84 b167)
(on b85 b78)
(on-table b86)
(on b87 b209)
(on b88 b207)
(on b89 b119)
(on b90 b96)
(on b91 b141)
(on b92 b200)
(on b93 b54)
(on b94 b175)
(on b95 b142)
(on b96 b3)
(on b97 b101)
(on b98 b196)
(on b99 b193)
(on b100 b85)
(on b101 b75)
(on b102 b117)
(on b103 b62)
(on b104 b197)
(on b105 b163)
(on b106 b218)
(on b107 b13)
(on b108 b87)
(on b109 b46)
(on b110 b179)
(on b111 b103)
(on b112 b88)
(on b113 b215)
(on b114 b194)
(on b115 b22)
(on b116 b148)
(on b117 b137)
(on b118 b64)
(on b119 b106)
(on b120 b37)
(on b121 b104)
(on b122 b63)
(on b123 b97)
(on b124 b107)
(on b125 b65)
(on b126 b178)
(on b127 b59)
(on b128 b210)
(on b129 b99)
(on b130 b94)
(on b131 b121)
(on b132 b165)
(on b133 b174)
(on b134 b120)
(on b135 b27)
(on b136 b20)
(on b137 b122)
(on b138 b36)
(on b139 b180)
(on b140 b192)
(on b141 b18)
(on b142 b31)
(on b143 b105)
(on b144 b30)
(on b145 b60)
(on b146 b115)
(on b147 b109)
(on b148 b41)
(on b149 b203)
(on b150 b19)
(on b151 b187)
(on b152 b9)
(on b153 b127)
(on b154 b220)
(on b155 b160)
(on b156 b114)
(on-table b157)
(on b158 b61)
(on b159 b145)
(on b160 b173)
(on b161 b11)
(on b162 b79)
(on b163 b159)
(on b164 b23)
(on b165 b112)
(on b166 b91)
(on b167 b71)
(on b168 b176)
(on b169 b183)
(on b170 b128)
(on b171 b40)
(on b172 b147)
(on b173 b17)
(on-table b174)
(on b175 b50)
(on b176 b52)
(on-table b177)
(on b178 b110)
(on b179 b89)
(on b180 b35)
(on b181 b43)
(on b182 b172)
(on b183 b184)
(on b184 b16)
(on b185 b28)
(on b186 b151)
(on b187 b199)
(on b188 b113)
(on b189 b76)
(on b190 b202)
(on b191 b206)
(on b192 b12)
(on b193 b158)
(on b194 b58)
(on b195 b98)
(on b196 b201)
(on b197 b162)
(on b198 b86)
(on b199 b190)
(on b200 b188)
(on b201 b102)
(on b202 b130)
(on b203 b83)
(on b204 b177)
(on b205 b161)
(on b206 b125)
(on b207 b25)
(on b208 b21)
(on b209 b1)
(on b210 b82)
(on b211 b7)
(on b212 b44)
(on b213 b10)
(on b214 b111)
(on b215 b126)
(on b216 b39)
(on b217 b8)
(on b218 b33)
(on b219 b4)
(on b220 b214)
(clear b6)
(clear b34)
(clear b38)
(clear b48)
(clear b95)
(clear b118)
(clear b150)
(clear b154)
(clear b164)
(clear b168)
(clear b182)
(clear b186)
(clear b216)
)
(:goal
(and
(on b1 b2))
)
)


