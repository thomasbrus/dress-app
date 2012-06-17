_       = require 'underscore'
stores  = require './stores'

SIZES = ['xs', 's', 'm', 'l', 'xl']

exports.top_9 =
  
  johnboy_iii:
    id: 1
    title: 'JohnBoy III'
    image: '/images/articles/johnboy-iii.png'
    brand: 'Khujo'
    color: 'Blauw / grijs'

  campagnolo:
    id: 2
    title: 'Campagnolo'
    image: '/images/articles/campagnolo.png'
    brand: 'Nike'
    color: 'Geel'

  june_camp:
    id: 3
    title: 'June Camp'
    image: '/images/articles/june-camp.png'
    brand: 'Khujo'
    color: 'Blauw / grijs'  
  
  esprit:
    id: 4
    title: 'Esprit'
    image: '/images/articles/esprit.png'
    brand: 'Khujo'
    color: 'Blauw / grijs'

  bugatti:
    id: 5
    title: 'Bugatti'
    image: '/images/articles/bugatti.png'
    brand: 'Khujo'
    color: 'Blauw / grijs'

  humor:
    id: 6
    title: 'Humor'
    image: '/images/articles/humor.png'
    brand: 'Khujo'
    color: 'Blauw / grijs'

  temaru:
    id: 7
    title: 'Temaru'
    image: '/images/articles/temaru.png'
    brand: 'Khujo'
    color: 'Blauw / grijs'

  spray:
    id: 8
    title: 'Spray'
    image: '/images/articles/spray.png'
    brand: 'Khujo'
    color: 'Blauw / grijs'

  tiki:
    id: 9
    title: 'Tiki'
    image: '/images/articles/tiki.png'
    brand: 'Khujo'
    color: 'Blauw / grijs'
    
exports.themed =

  dog:
    id: 1
    title: 'Kersthond'
    image: '/images/articles/christmas/dog.png'
    brand: 'Christ'
    color: 'Zwart met print'

  santa:
    id: 2
    title: 'Kerstman'
    image: '/images/articles/christmas/santa.png'
    brand: 'Gsus'
    color: 'Rood'

  hat:
    id: 3
    title: 'Kerstmuts'
    image: '/images/articles/christmas/hat.png'
    brand: 'Gsus'
    color: 'Rood'

  earmuffs:
    id: 4
    title: 'Oorwarmers'
    image: '/images/articles/christmas/earmuffs.jpg'
    brand: 'Gsus'
    color: 'Rood'

  tie:
    id: 5
    title: 'Stropdas'
    image: '/images/articles/christmas/tie.png'
    brand: 'Chris'
    color: 'Rood'

  antlers:
    id: 6
    title: 'Gewei'
    image: '/images/articles/christmas/antlers.png'
    brand: 'Gsus'
    color: 'Rood / Groen'

  merry_christmas:
    id: 7
    title: 'Nen zoalige kerst'
    image: '/images/articles/christmas/merry-christmas.png'
    brand: 'Gsus'
    color: 'Zwart / Rood / Groen'

  window_shirt:
    id: 8
    title: 'Vensteroverhemd'
    image: '/images/articles/christmas/window-shirt.png'
    brand: 'Gsus'
    color: 'Wit / Rood'

  sparrow_shirt:
    id: 9
    title: 'Overhemd met een mus'
    image: '/images/articles/christmas/sparrow-shirt.png'
    brand: 'Christ'
    color: 'Wit met print'

for category, articles of exports
  for article, attrs of articles
    attrs.assortments = {}
    related = _.values(exports[category])
    related = _.without(related, attrs)
    related = _.shuffle(related)
    attrs.related = related[0...3]
    base_price = Math.random() * 30
    for size, i in SIZES
      attrs.assortments[size] = {}
      price = base_price + i
      for store in _.pluck(stores, 'title')
        if Math.random() > 0.8
          store_price = null
        else
          store_price = Math.round((price + Math.random()) * 100) / 100
        attrs.assortments[size][store] = store_price
