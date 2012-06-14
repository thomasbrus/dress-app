_ = require 'underscore'

exports.kersthond =
  id: 1
  title: 'Kersthond'
  image: '/images/kersthond.png'
  brand: 'Christ'
  color: 'Zwart met print'

exports.kerstman =
  id: 2
  title: 'Kerstman'
  image: '/images/kerstman.png'
  brand: 'Gsus'
  color: 'Rood'

exports.kerstmuts =
  id: 3
  title: 'Kerstmuts'
  image: '/images/kerstmuts.png'
  brand: 'Gsus'
  color: 'Rood'
  
exports.kerstjurk =
  id: 4
  title: 'Kerstjurk'
  image: '/images/kerstjurk.png'
  brand: 'Gsus'
  color: 'Rood'

exports.stropdas =
  id: 5
  title: 'Stropdas'
  image: '/images/stropdas.png'
  brand: 'Chris'
  color: 'Rood'

exports.gewei =
  id: 6
  title: 'Gewei'
  image: '/images/gewei.png'
  brand: 'Gsus'
  color: 'Rood / Groen'

exports.nen_zoalige_kerst =
  id: 7
  title: 'Nen zoalige kerst'
  image: '/images/nen-zoalige.png'
  brand: 'Gsus'
  color: 'Zwart / Rood / Groen'

exports.vensteroverhemd =
  id: 8
  title: 'Vensteroverhemd'
  image: '/images/vensteroverhemd.png'
  brand: 'Gsus'
  color: 'Wit / Rood'

exports.mus_overhemd =
  id: 9
  title: 'Overhemd met een mus'
  image: '/images/overhemd-mus.png'
  brand: 'Christ'
  color: 'Wit met print'

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
