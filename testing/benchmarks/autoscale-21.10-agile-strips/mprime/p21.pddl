(define (problem strips-mprime-l20-f15-s4-v16-c25)
(:domain mprime-strips)
(:objects f0 f1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12 f13 f14 f15 - fuel
          s0 s1 s2 s3 s4 - space
          l0 l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 l15 l16 l17 l18 l19 - location
          v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 - vehicle
          c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 - cargo)
(:init
(not-equal l0 l1)
(not-equal l0 l2)
(not-equal l0 l3)
(not-equal l0 l4)
(not-equal l0 l5)
(not-equal l0 l6)
(not-equal l0 l7)
(not-equal l0 l8)
(not-equal l0 l9)
(not-equal l0 l10)
(not-equal l0 l11)
(not-equal l0 l12)
(not-equal l0 l13)
(not-equal l0 l14)
(not-equal l0 l15)
(not-equal l0 l16)
(not-equal l0 l17)
(not-equal l0 l18)
(not-equal l0 l19)
(not-equal l1 l0)
(not-equal l1 l2)
(not-equal l1 l3)
(not-equal l1 l4)
(not-equal l1 l5)
(not-equal l1 l6)
(not-equal l1 l7)
(not-equal l1 l8)
(not-equal l1 l9)
(not-equal l1 l10)
(not-equal l1 l11)
(not-equal l1 l12)
(not-equal l1 l13)
(not-equal l1 l14)
(not-equal l1 l15)
(not-equal l1 l16)
(not-equal l1 l17)
(not-equal l1 l18)
(not-equal l1 l19)
(not-equal l2 l0)
(not-equal l2 l1)
(not-equal l2 l3)
(not-equal l2 l4)
(not-equal l2 l5)
(not-equal l2 l6)
(not-equal l2 l7)
(not-equal l2 l8)
(not-equal l2 l9)
(not-equal l2 l10)
(not-equal l2 l11)
(not-equal l2 l12)
(not-equal l2 l13)
(not-equal l2 l14)
(not-equal l2 l15)
(not-equal l2 l16)
(not-equal l2 l17)
(not-equal l2 l18)
(not-equal l2 l19)
(not-equal l3 l0)
(not-equal l3 l1)
(not-equal l3 l2)
(not-equal l3 l4)
(not-equal l3 l5)
(not-equal l3 l6)
(not-equal l3 l7)
(not-equal l3 l8)
(not-equal l3 l9)
(not-equal l3 l10)
(not-equal l3 l11)
(not-equal l3 l12)
(not-equal l3 l13)
(not-equal l3 l14)
(not-equal l3 l15)
(not-equal l3 l16)
(not-equal l3 l17)
(not-equal l3 l18)
(not-equal l3 l19)
(not-equal l4 l0)
(not-equal l4 l1)
(not-equal l4 l2)
(not-equal l4 l3)
(not-equal l4 l5)
(not-equal l4 l6)
(not-equal l4 l7)
(not-equal l4 l8)
(not-equal l4 l9)
(not-equal l4 l10)
(not-equal l4 l11)
(not-equal l4 l12)
(not-equal l4 l13)
(not-equal l4 l14)
(not-equal l4 l15)
(not-equal l4 l16)
(not-equal l4 l17)
(not-equal l4 l18)
(not-equal l4 l19)
(not-equal l5 l0)
(not-equal l5 l1)
(not-equal l5 l2)
(not-equal l5 l3)
(not-equal l5 l4)
(not-equal l5 l6)
(not-equal l5 l7)
(not-equal l5 l8)
(not-equal l5 l9)
(not-equal l5 l10)
(not-equal l5 l11)
(not-equal l5 l12)
(not-equal l5 l13)
(not-equal l5 l14)
(not-equal l5 l15)
(not-equal l5 l16)
(not-equal l5 l17)
(not-equal l5 l18)
(not-equal l5 l19)
(not-equal l6 l0)
(not-equal l6 l1)
(not-equal l6 l2)
(not-equal l6 l3)
(not-equal l6 l4)
(not-equal l6 l5)
(not-equal l6 l7)
(not-equal l6 l8)
(not-equal l6 l9)
(not-equal l6 l10)
(not-equal l6 l11)
(not-equal l6 l12)
(not-equal l6 l13)
(not-equal l6 l14)
(not-equal l6 l15)
(not-equal l6 l16)
(not-equal l6 l17)
(not-equal l6 l18)
(not-equal l6 l19)
(not-equal l7 l0)
(not-equal l7 l1)
(not-equal l7 l2)
(not-equal l7 l3)
(not-equal l7 l4)
(not-equal l7 l5)
(not-equal l7 l6)
(not-equal l7 l8)
(not-equal l7 l9)
(not-equal l7 l10)
(not-equal l7 l11)
(not-equal l7 l12)
(not-equal l7 l13)
(not-equal l7 l14)
(not-equal l7 l15)
(not-equal l7 l16)
(not-equal l7 l17)
(not-equal l7 l18)
(not-equal l7 l19)
(not-equal l8 l0)
(not-equal l8 l1)
(not-equal l8 l2)
(not-equal l8 l3)
(not-equal l8 l4)
(not-equal l8 l5)
(not-equal l8 l6)
(not-equal l8 l7)
(not-equal l8 l9)
(not-equal l8 l10)
(not-equal l8 l11)
(not-equal l8 l12)
(not-equal l8 l13)
(not-equal l8 l14)
(not-equal l8 l15)
(not-equal l8 l16)
(not-equal l8 l17)
(not-equal l8 l18)
(not-equal l8 l19)
(not-equal l9 l0)
(not-equal l9 l1)
(not-equal l9 l2)
(not-equal l9 l3)
(not-equal l9 l4)
(not-equal l9 l5)
(not-equal l9 l6)
(not-equal l9 l7)
(not-equal l9 l8)
(not-equal l9 l10)
(not-equal l9 l11)
(not-equal l9 l12)
(not-equal l9 l13)
(not-equal l9 l14)
(not-equal l9 l15)
(not-equal l9 l16)
(not-equal l9 l17)
(not-equal l9 l18)
(not-equal l9 l19)
(not-equal l10 l0)
(not-equal l10 l1)
(not-equal l10 l2)
(not-equal l10 l3)
(not-equal l10 l4)
(not-equal l10 l5)
(not-equal l10 l6)
(not-equal l10 l7)
(not-equal l10 l8)
(not-equal l10 l9)
(not-equal l10 l11)
(not-equal l10 l12)
(not-equal l10 l13)
(not-equal l10 l14)
(not-equal l10 l15)
(not-equal l10 l16)
(not-equal l10 l17)
(not-equal l10 l18)
(not-equal l10 l19)
(not-equal l11 l0)
(not-equal l11 l1)
(not-equal l11 l2)
(not-equal l11 l3)
(not-equal l11 l4)
(not-equal l11 l5)
(not-equal l11 l6)
(not-equal l11 l7)
(not-equal l11 l8)
(not-equal l11 l9)
(not-equal l11 l10)
(not-equal l11 l12)
(not-equal l11 l13)
(not-equal l11 l14)
(not-equal l11 l15)
(not-equal l11 l16)
(not-equal l11 l17)
(not-equal l11 l18)
(not-equal l11 l19)
(not-equal l12 l0)
(not-equal l12 l1)
(not-equal l12 l2)
(not-equal l12 l3)
(not-equal l12 l4)
(not-equal l12 l5)
(not-equal l12 l6)
(not-equal l12 l7)
(not-equal l12 l8)
(not-equal l12 l9)
(not-equal l12 l10)
(not-equal l12 l11)
(not-equal l12 l13)
(not-equal l12 l14)
(not-equal l12 l15)
(not-equal l12 l16)
(not-equal l12 l17)
(not-equal l12 l18)
(not-equal l12 l19)
(not-equal l13 l0)
(not-equal l13 l1)
(not-equal l13 l2)
(not-equal l13 l3)
(not-equal l13 l4)
(not-equal l13 l5)
(not-equal l13 l6)
(not-equal l13 l7)
(not-equal l13 l8)
(not-equal l13 l9)
(not-equal l13 l10)
(not-equal l13 l11)
(not-equal l13 l12)
(not-equal l13 l14)
(not-equal l13 l15)
(not-equal l13 l16)
(not-equal l13 l17)
(not-equal l13 l18)
(not-equal l13 l19)
(not-equal l14 l0)
(not-equal l14 l1)
(not-equal l14 l2)
(not-equal l14 l3)
(not-equal l14 l4)
(not-equal l14 l5)
(not-equal l14 l6)
(not-equal l14 l7)
(not-equal l14 l8)
(not-equal l14 l9)
(not-equal l14 l10)
(not-equal l14 l11)
(not-equal l14 l12)
(not-equal l14 l13)
(not-equal l14 l15)
(not-equal l14 l16)
(not-equal l14 l17)
(not-equal l14 l18)
(not-equal l14 l19)
(not-equal l15 l0)
(not-equal l15 l1)
(not-equal l15 l2)
(not-equal l15 l3)
(not-equal l15 l4)
(not-equal l15 l5)
(not-equal l15 l6)
(not-equal l15 l7)
(not-equal l15 l8)
(not-equal l15 l9)
(not-equal l15 l10)
(not-equal l15 l11)
(not-equal l15 l12)
(not-equal l15 l13)
(not-equal l15 l14)
(not-equal l15 l16)
(not-equal l15 l17)
(not-equal l15 l18)
(not-equal l15 l19)
(not-equal l16 l0)
(not-equal l16 l1)
(not-equal l16 l2)
(not-equal l16 l3)
(not-equal l16 l4)
(not-equal l16 l5)
(not-equal l16 l6)
(not-equal l16 l7)
(not-equal l16 l8)
(not-equal l16 l9)
(not-equal l16 l10)
(not-equal l16 l11)
(not-equal l16 l12)
(not-equal l16 l13)
(not-equal l16 l14)
(not-equal l16 l15)
(not-equal l16 l17)
(not-equal l16 l18)
(not-equal l16 l19)
(not-equal l17 l0)
(not-equal l17 l1)
(not-equal l17 l2)
(not-equal l17 l3)
(not-equal l17 l4)
(not-equal l17 l5)
(not-equal l17 l6)
(not-equal l17 l7)
(not-equal l17 l8)
(not-equal l17 l9)
(not-equal l17 l10)
(not-equal l17 l11)
(not-equal l17 l12)
(not-equal l17 l13)
(not-equal l17 l14)
(not-equal l17 l15)
(not-equal l17 l16)
(not-equal l17 l18)
(not-equal l17 l19)
(not-equal l18 l0)
(not-equal l18 l1)
(not-equal l18 l2)
(not-equal l18 l3)
(not-equal l18 l4)
(not-equal l18 l5)
(not-equal l18 l6)
(not-equal l18 l7)
(not-equal l18 l8)
(not-equal l18 l9)
(not-equal l18 l10)
(not-equal l18 l11)
(not-equal l18 l12)
(not-equal l18 l13)
(not-equal l18 l14)
(not-equal l18 l15)
(not-equal l18 l16)
(not-equal l18 l17)
(not-equal l18 l19)
(not-equal l19 l0)
(not-equal l19 l1)
(not-equal l19 l2)
(not-equal l19 l3)
(not-equal l19 l4)
(not-equal l19 l5)
(not-equal l19 l6)
(not-equal l19 l7)
(not-equal l19 l8)
(not-equal l19 l9)
(not-equal l19 l10)
(not-equal l19 l11)
(not-equal l19 l12)
(not-equal l19 l13)
(not-equal l19 l14)
(not-equal l19 l15)
(not-equal l19 l16)
(not-equal l19 l17)
(not-equal l19 l18)
(fuel-neighbor f0 f1)
(fuel-neighbor f1 f2)
(fuel-neighbor f2 f3)
(fuel-neighbor f3 f4)
(fuel-neighbor f4 f5)
(fuel-neighbor f5 f6)
(fuel-neighbor f6 f7)
(fuel-neighbor f7 f8)
(fuel-neighbor f8 f9)
(fuel-neighbor f9 f10)
(fuel-neighbor f10 f11)
(fuel-neighbor f11 f12)
(fuel-neighbor f12 f13)
(fuel-neighbor f13 f14)
(fuel-neighbor f14 f15)
(space-neighbor s0 s1)
(space-neighbor s1 s2)
(space-neighbor s2 s3)
(space-neighbor s3 s4)
(conn l0 l1)
(conn l1 l0)
(conn l1 l2)
(conn l2 l1)
(conn l2 l3)
(conn l3 l2)
(conn l3 l4)
(conn l4 l3)
(conn l4 l5)
(conn l5 l4)
(conn l5 l6)
(conn l6 l5)
(conn l6 l7)
(conn l7 l6)
(conn l7 l8)
(conn l8 l7)
(conn l8 l9)
(conn l9 l8)
(conn l9 l10)
(conn l10 l9)
(conn l10 l11)
(conn l11 l10)
(conn l11 l12)
(conn l12 l11)
(conn l12 l13)
(conn l13 l12)
(conn l13 l14)
(conn l14 l13)
(conn l14 l15)
(conn l15 l14)
(conn l15 l16)
(conn l16 l15)
(conn l16 l17)
(conn l17 l16)
(conn l17 l18)
(conn l18 l17)
(conn l18 l19)
(conn l19 l18)
(conn l19 l0)
(conn l0 l19)
(has-fuel l0 f14)
(has-fuel l1 f1)
(has-fuel l2 f1)
(has-fuel l3 f1)
(has-fuel l4 f12)
(has-fuel l5 f7)
(has-fuel l6 f14)
(has-fuel l7 f1)
(has-fuel l8 f14)
(has-fuel l9 f7)
(has-fuel l10 f10)
(has-fuel l11 f12)
(has-fuel l12 f11)
(has-fuel l13 f6)
(has-fuel l14 f15)
(has-fuel l15 f8)
(has-fuel l16 f12)
(has-fuel l17 f10)
(has-fuel l18 f12)
(has-fuel l19 f0)
(has-space  v0 s4)
(has-space  v1 s4)
(has-space  v2 s3)
(has-space  v3 s4)
(has-space  v4 s1)
(has-space  v5 s1)
(has-space  v6 s1)
(has-space  v7 s1)
(has-space  v8 s4)
(has-space  v9 s1)
(has-space  v10 s3)
(has-space  v11 s3)
(has-space  v12 s3)
(has-space  v13 s4)
(has-space  v14 s4)
(has-space  v15 s3)
(at v0 l3)
(at v1 l6)
(at v2 l17)
(at v3 l15)
(at v4 l13)
(at v5 l15)
(at v6 l6)
(at v7 l12)
(at v8 l9)
(at v9 l1)
(at v10 l2)
(at v11 l7)
(at v12 l10)
(at v13 l19)
(at v14 l3)
(at v15 l6)
(at c0 l0)
(at c1 l6)
(at c2 l12)
(at c3 l16)
(at c4 l11)
(at c5 l8)
(at c6 l7)
(at c7 l9)
(at c8 l2)
(at c9 l10)
(at c10 l2)
(at c11 l3)
(at c12 l7)
(at c13 l15)
(at c14 l9)
(at c15 l2)
(at c16 l2)
(at c17 l18)
(at c18 l9)
(at c19 l7)
(at c20 l13)
(at c21 l16)
(at c22 l11)
(at c23 l2)
(at c24 l9)
)
(:goal
(and
(at c0 l13)
(at c1 l1)
(at c2 l19)
(at c3 l4)
(at c4 l17)
(at c5 l18)
(at c6 l4)
(at c7 l15)
(at c8 l10)
(at c9 l13)
(at c10 l6)
(at c11 l11)
(at c12 l0)
(at c13 l16)
(at c14 l13)
(at c15 l2)
(at c16 l10)
(at c17 l16)
(at c18 l1)
(at c19 l5)
(at c20 l5)
(at c21 l4)
(at c22 l7)
(at c23 l16)
(at c24 l5)
)
)
)
