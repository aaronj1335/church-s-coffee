module.exports =

  tru:    (b)-> (c)-> b
  fls:    (b)-> (c)-> c

  orl:    (b)-> (c)-> b(b)(c)
  andl:   (b)-> (c)-> b(c)(b)
  notl:   (b)-> b(fls)(tru)

  pair:   (x)-> (y)-> (b)-> b(x)(y)
  fst:    (p)-> p(tru)
  snd:    (p)-> p(fls)

  zero:   (s)-> (z)-> z
  one:    (s)-> (z)-> s(z)
  two:    (s)-> (z)-> s(s(z))
  three:  (s)-> (z)-> s(s(s(z)))
  four:   (s)-> (z)-> s(s(s(s(z))))
  five:   (s)-> (z)-> s(s(s(s(s(z)))))
  six:    (s)-> (z)-> s(s(s(s(s(s(z))))))
  seven:  (s)-> (z)-> s(s(s(s(s(s(s(z)))))))
  eight:  (s)-> (z)-> s(s(s(s(s(s(s(s(z))))))))
  nine:   (s)-> (z)-> s(s(s(s(s(s(s(s(s(z)))))))))
  ten:    (s)-> (z)-> s(s(s(s(s(s(s(s(s(s(z))))))))))

  succ:   (n)-> (s)-> (z)-> s(n(s)(z))

  plus:   (m)-> (n)-> (s)-> (z)-> m(s)(n(s)(z))
  # plus:    (x)-> (y)-> (s)-> (z)-> x(succ)(y)(s)(z) # this also seems to work...

  times:  (m)-> (n)-> (s)-> (z)-> m(n(s))(z)
  # times: (m)-> (n)-> (m plus(n)) zero # this one is from the text

  pow:    (m)-> (n)-> (s)-> (z)-> n(m)(s)(z)

  iszero: (n)-> n((x)->fls)(tru)
