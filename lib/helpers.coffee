exports.isNum = isNum = (a)->
  Object.prototype.toString.call(a) == '[object Number]'
exports.toNum = (n)-> if isNum n then n else n((i)->++i)(0)
exports.prep = (l)->
  l[k[...-1]] = l.fix v for k, v of l when k[-1..] == 'G'
  return l
