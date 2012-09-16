module.exports =

  tru:    (b)-> (c)-> b
  fls:    (b)-> (c)-> c
  test:   (b)-> (x)-> (y)-> b(x)(y)

  notl:   (b)-> b(fls)(tru)
  orl:    (b)-> (c)-> b(b)(c)
  andl:   (b)-> (c)-> b(c)(b)
  xorl:   (b)-> (c)-> orl(andl(b)(notl(c)))(andl(notl(b))(c))
  xnorl:  (b)-> (c)-> notl(xorl(b)(c))


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

  pred:   (n)->
            zero_pair = pair(zero)(zero)
            pair_inc = (p)-> pair(snd(p))(succ(snd(p)))
            fst(n(pair_inc)(zero_pair))

  iszero: (n)-> n((x)->fls)(tru)

  # equal:  (m)-> (n)->
  #   # this defines an iteration function that is applied m+1 times. at each
  #   # iteration it checks a validity condition, and then returns the two values
  #   # decremented.
  #   #
  #   # the validity condition is an xnor of the two values iszero'ed, since, if
  #   # at any point one value equals zero and the other doesn't, we know that
  #   # they are not equal
  #   valid = (p)-> (v)-> andl(v)(xnorl(iszero(fst(p)))(iszero(snd(p))))

  #   iteration = (t)->
  #     p = fst(t)
  #     preds = pair(pred(fst(p)))(pred(snd(p)))
  #     v = snd(t)
  #     test(iszero(fst(p)))(
  #       valid(p)(v)
  #     )(
  #       pair(preds)(valid(p)(v))
  #     )

  #   succ(m)(iteration)(pair(pair(m)(n))(tru))

  equal: (m)-> (n)->
    # HASHTAG FACEPALM -- this is a much simpler implementation...
    andl(
      iszero(m(pred)(n)))(
      iszero(n(pred)(m)))


  plus:   (m)-> (n)-> (s)-> (z)-> m(s)(n(s)(z))
  # plus:    (x)-> (y)-> (s)-> (z)-> x(succ)(y)(s)(z) # this also seems to work...

  times:  (m)-> (n)-> (s)-> (z)-> m(n(s))(z)
  # times: (m)-> (n)-> (m plus(n)) zero # this one is from the text

  pow:    (m)-> (n)-> (s)-> (z)-> n(m)(s)(z)

  minus:  (m)-> (n)-> n(pred)(m)
