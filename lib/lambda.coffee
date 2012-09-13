module.exports =

  tru: (b)-> (c)-> b
  fls: (b)-> (c)-> c

  orl: (b)-> (c)-> b(b)(c)
  andl: (b)-> (c)-> b(c)(b)
  notl: (b)-> b(fls)(tru)

  pair: (x)-> (y)-> (b)-> b(x)(y)
  fst: (p)-> p(tru)
  snd: (p)-> p(fls)

  zero:   (s)-> (z)-> z
  one:    (s)-> (z)-> s(z)
  two:    (s)-> (z)-> s(s(z))
  three:  (s)-> (z)-> s(s(s(z)))

  succ: (n)-> (s)-> (z)-> s(n(s)(z))


  globalize: ()-> global[k] = v for k,v of module.exports

# for i in [1..100]
#   module.exports['n'+i] = (n)-> (s)-> (z)-> n(module.exports['s'+(i-1)])
