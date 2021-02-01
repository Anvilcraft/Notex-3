// priority: 0

settings.logAddedRecipes = true
settings.logRemovedRecipes = true
settings.logSkippedRecipes = false
settings.logErroringRecipes = true

console.info('Hello, World! (You will see this line every time server resources reload)')

events.listen('recipes', event => {
  event.remove({output: "angelring:itemring"})
  event.remove({output: "alchemistry:chemical_combiner"})
  event.remove({output: "alchemistry:chemical_dissolver"})
  event.remove({output: "compactmachines:wall"})
  event.remove({output: "compactmachines:machine_tiny"})
  event.remove({output: "compactmachines:machine_small"})
  event.remove({output: "compactmachines:machine_normal"})
  event.remove({output: "compactmachines:machine_large"})
  event.remove({output: "compactmachines:machine_giant"})
  event.remove({output: "compactmachines:machine_large"})
  event.remove({output: "compactmachines:personal_shrinking_device"})
  event.remove({output: 'ring_of_teleport:ring_of_teleport'})
  event.remove({output: 'ring_of_enderchest:ring_of_enderchest'})
  event.remove({output: 'ring_of_repair:ring_of_repair'})
  event.remove({output: 'ring_of_blink:ring_of_blink'})

  event.shaped('alchemistry:chemical_combiner', [
    'SSS',
    'ACA',
    'SSS'
    ], {
      S: '#forge:ingots/steel',
      C: 'mekanism:chemical_crystallizer',
      A: 'mekanism:alloy_atomic'
  })
  event.shaped('alchemistry:chemical_dissolver', [
    'SSS',
    'ACA',
    'SSS'
    ], {
      S: '#forge:ingots/steel',
      C: 'mekanism:chemical_dissolution_chamber',
      A: 'mekanism:alloy_atomic'
  })
  event.shaped('compactmachines:wall', [
    'TTT',
    'TCT',
    'TTT'
    ], {
      T: 'chemlib:ingot_thorium',
      C: '#forge:ingots/chromium'
  })
  event.shaped('compactmachines:machine_tiny', [
    'CCC',
    'CTC',
    'CCC'
    ], {
      T: 'mekanism:teleportation_core',
      C: 'compactmachines:wall'
  })
  event.shaped('compactmachines:machine_small', [
    'CCC',
    'CMC',
    'CCC'
    ], {
      M: 'compactmachines:machine_tiny',
      C: 'compactmachines:wall'
  })
  event.shaped('compactmachines:machine_normal', [
    'CCC',
    'CMC',
    'CCC'
    ], {
      M: 'compactmachines:machine_small',
      C: 'compactmachines:wall'
  })
  event.shaped('compactmachines:machine_large', [
    'CCC',
    'CMC',
    'CCC'
    ], {
      M: 'compactmachines:machine_normal',
      C: 'compactmachines:wall'
  })
  event.shaped('compactmachines:machine_giant', [
    'CCC',
    'CMC',
    'CCC'
    ], {
      M: 'compactmachines:machine_large',
      C: 'compactmachines:wall'
  })
  event.shaped('compactmachines:machine_maximum', [
    'CCC',
    'CMC',
    'CCC'
    ], {
      M: 'compactmachines:machine_giant',
      C: 'compactmachines:wall'
  })
  event.shaped('compactmachines:personal_shrinking_device', [
    'III',
    'ICI',
    'TTT'
    ], {
      T: 'mekanism:teleportation_core',
      C: '#forge:ingots/chromium',
      I: '#forge:ingots'
  })
  event.shaped('ring_of_teleport:ring_of_teleport', [
    'EM ',
    'M M',
    ' M '
    ], {
      E: '#forge:ender_pearls',
      M: 'botania:manasteel_ingot'
  })
  event.shaped('ring_of_enderchest:ring_of_enderchest', [
    'EM ',
    'M M',
    ' M '
    ], {
      E: '#forge:chests/ender',
      M: 'botania:manasteel_ingot'
  })
  event.shaped('ring_of_repair:ring_of_repair', [
    'ME ',
    'E E',
    ' E '
    ], {
      M: Item.of('minecraft:enchanted_book', {StoredEnchantments:[{lvl:1,id:"minecraft:mending"}]}),
      E: 'botania:elementium_ingot'
  })
  event.shapeless('ring_of_blink:ring_of_blink', ['ring_of_teleport:ring_of_teleport', 'botania:terrasteel_ingot'])

  event.custom({
    "type": "astralsorcery:altar",
    "altar_type": 2,
    "duration": 400,
    "starlight": 2600,
    "pattern": [
      "WT_TW",
      "TGEGT",
      "_EDE_",
      "_GEG_",
      "RN_NA"
    ],
    "key": {
      "A": {
        "item": "cyclic:antigravity"
      },
      "N": {
        "item": "minecraft:nether_star"
      },
      "E": {
        "item": "botania:elementium_ingot"
      },
      "G": {
        "item": "minecraft:gold_ingot"
      },
      "W": {
        "item": "forbidden_arcanus:bat_wing"
      },
      "T": {
        "item": "minecraft:ghast_tear"
      },
      "R": {
        "item": "botania:rune_air"
      },
      "D": {
        "item": "angelring:itemdiamondring"
      }
    },
    "output": [
      {
        "item": "angelring:itemring",
        "count": 1
      }
    ],
    "effects": [
      "astralsorcery:built_in_effect_discovery_central_beam",
      "astralsorcery:altar_default_sparkle"
    ]
  }
)
})
