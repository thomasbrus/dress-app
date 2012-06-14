_ = require 'underscore'

exports.johnboy_iii =
  id: 1
  title: 'JohnBoy III'
  image: '/images/johnboy-iii.png'
  brand: 'Khujo'
  color: 'Blauw / grijs'

exports.campagnolo =
  id: 2
  title: 'Campagnolo'
  image: '/images/campagnolo.png'
  brand: 'Nike'
  color: 'Geel'
  assortments:
    m:
      'C&A': 8
      'The Sting': 21
      'Open32': 4
      'H&M': 9

exports.june_camp =
  id: 3
  title: 'June Camp'
  image: '/images/june-camp.png'
  
exports.esprit =
  id: 4
  title: 'Esprit'
  image: '/images/esprit.png'

exports.bugatti =
  id: 5
  title: 'Bugatti'
  image: '/images/bugatti.png'

exports.humor =
  id: 6
  title: 'Humor'
  image: '/images/humor.png'

exports.temaru =
  id: 7
  title: 'Temaru'
  image: '/images/temaru.png'

exports.spray =
  id: 8
  title: 'Spray'
  image: '/images/spray.png'

exports.tiki =
  id: 9
  title: 'Tiki'
  image: '/images/tiki.png'

for name, article of exports
  article.assortments = {}
  for size in ['xs', 's', 'm', 'l', 'xl']
    article.assortments[size] = {}
    for store in ['C&A', 'The Sting', 'Open32', 'H&M']
      rand = Math.random() * 20
      if rand > 16
        count = 0
      else
        count = Math.floor rand
      article.assortments[size][store] = count

  pool = _.without(exports, article)
  pool = _.shuffle(pool)
  article.related = pool[0...3]
