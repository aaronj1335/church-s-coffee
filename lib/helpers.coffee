exports.isNum = isNum = (a)->
  Object.prototype.toString.call(a) == '[object Number]'
exports.toNum = (n)-> if isNum n then n else n((i)->++i)(0)
