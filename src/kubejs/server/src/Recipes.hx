package;

import kubejs.events.server.RecipesEvent;
import kubejs.Item;

class Recipes {
    // @formatter:off
    static final removeByOutput = [
        "angelring:itemring",
        "angelring:itemdiamondring",
        "alchemistry:chemical_combiner",
        "alchemistry:chemical_dissolver",
        "compactmachines:wall",
        "compactmachines:machine_tiny",
        "compactmachines:machine_small",
        "compactmachines:machine_normal",
        "compactmachines:machine_large",
        "compactmachines:machine_giant",
        "compactmachines:machine_large",
        "compactmachines:machine_maximum",
        "compactmachines:personal_shrinking_device",
        "ring_of_teleport:ring_of_teleport",
        "ring_of_enderchest:ring_of_enderchest",
        "ring_of_repair:ring_of_repair",
        "ring_of_blink:ring_of_blink",
        "crossroads:gear_facade_glass",
        "assemblylinemachines:simple_grinder",
        "assemblylinemachines:steel_blade_piece",
        "assemblylinemachines:steel_fluid_tank",
        "enderrift:rift",
        "enderrift:rift_orb"
    ];
    // @formatter:on
    public static function onEvent(event:RecipesEvent) {
        for (i in removeByOutput) {
            event.remove({output: i});
        }

        shapedRecipes(event);
        shapelessRecipes(event);
        customRecipes(event);
        replaceInputs(event);
    }

    static function shapedRecipes(event:RecipesEvent) {
        event.shaped("alchemistry:chemical_combiner", ["SSS", "ACA", "SSS"], {
            S: "#forge:ingots/steel",
            C: "mekanism:chemical_crystallizer",
            A: "mekanism:alloy_atomic"
        });

        event.shaped("alchemistry:chemical_dissolver", ["SSS", "ACA", "SSS"], {
            S: "#forge:ingots/steel",
            C: "mekanism:chemical_dissolution_chamber",
            A: "mekanism:alloy_atomic"
        });

        event.shaped("compactmachines:wall", ["TTT", "TCT", "TTT"], {
            T: "chemlib:ingot_thorium",
            C: "#forge:ingots/chromium"
        });

        event.shaped("compactmachines:machine_tiny", ["CCC", "CTC", "CCC"], {
            T: "mekanism:teleportation_core",
            C: "compactmachines:wall"
        });

        event.shaped("compactmachines:machine_small", ["CCC", "CMC", "CCC"], {
            M: "compactmachines:machine_tiny",
            C: "compactmachines:wall"
        });

        event.shaped("compactmachines:machine_normal", ["CCC", "CMC", "CCC"], {
            M: "compactmachines:machine_small",
            C: "compactmachines:wall"
        });

        event.shaped("compactmachines:machine_large", ["CCC", "CMC", "CCC"], {
            M: "compactmachines:machine_normal",
            C: "compactmachines:wall"
        });

        event.shaped("compactmachines:machine_giant", ["CCC", "CMC", "CCC"], {
            M: "compactmachines:machine_large",
            C: "compactmachines:wall"
        });

        event.shaped("compactmachines:machine_maximum", ["CCC", "CMC", "CCC"], {
            M: "compactmachines:machine_giant",
            C: "compactmachines:wall"
        });

        event.shaped("compactmachines:personal_shrinking_device", ["III", "ICI", "TTT"], {
            T: "mekanism:teleportation_core",
            C: "#forge:ingots/chromium",
            I: "#forge:ingots"
        });

        event.shaped("ring_of_teleport:ring_of_teleport", ["EM ", "M M", " M "], {
            E: "#forge:ender_pearls",
            M: "botania:manasteel_ingot"
        });

        event.shaped("ring_of_enderchest:ring_of_enderchest", ["EM ", "M M", " M "], {
            E: "#forge:chests/ender",
            M: "botania:manasteel_ingot"
        });

        event.shaped("ring_of_repair:ring_of_repair", ["ME ", "E E", " E "], {
            M: Item.of("minecraft:enchanted_book", 1, {StoredEnchantments: [{lvl: 1, id: "minecraft:mending"}]}),
            E: "botania:elementium_ingot"
        });

        event.shaped("angelring:itemring", ["WGW", "GRG", "TGT"], {
            G: "minecraft:gold_ingot",
            R: "angelring:itemdiamondring",
            W: "forbidden_arcanus:bat_wing",
            T: "minecraft:ghast_tear"
        });

        event.shaped("angelring:itemdiamondring", ["DED", "ECE", "DED"], {
            C: "minecraft:nether_star",
            E: "botania:manasteel_ingot",
            D: "minecraft:diamond_block"
        });

        event.shaped("angelring:itemdiamondring", ["DED", "ECE", "DED"], {
            C: "minecraft:elytra",
            E: "botania:manasteel_ingot",
            D: "minecraft:diamond_block"
        });

        event.shaped(Item.of("minecraft:chest", 4), ["WWW", "W W", "WWW"], {
            W: "#minecraft:logs"
        });

        event.shaped(Item.of("minecraft:stick", 16), ["W", "W"], {
            W: "#minecraft:logs"
        });

        event.shaped("minecraft:hopper", ["IWI", "IWI", " I "], {I: "#forge:ingots/iron", W: "#minecraft:logs"});

        event.shaped("minecraft:repeater", ["R R", "SRS", "sss"], {R: "#forge:dusts/redstone", S: "#forge:rods/wooden", s: "minecraft:stone"});

        event.shaped("enderrift:rift", ["LEL", "ECE", "LEL"], {
            L: "#forge:ingots/lawrencium",
            E: "minecraft:ender_eye",
            C: "mekanism:teleportation_core"
        });
    }

    static function shapelessRecipes(event:RecipesEvent) {
        event.shapeless("ring_of_blink:ring_of_blink", ["ring_of_teleport:ring_of_teleport", "botania:terrasteel_ingot"]);
    }

    static function customRecipes(event:RecipesEvent) {
        // Steel plate with multiservo press
        event.custom({
            type: "thermal:press",
            ingredient: {
                tag: "forge:ingots/steel"
            },
            result: [
                {
                    item: "immersiveengineering:plate_steel"
                }
            ]
        });

        // Certus Quartz dust with pulverizer
        event.custom({
            type: "thermal:pulverizer",
            ingredient: {
                tag: "forge:gems/certus_quartz"
            },
            result: [
                {
                    item: "appliedenergistics2:certus_quartz_dust"
                }
            ]
        });

        // Resourceful bees honey to honey block in blast chiller
        event.custom({
            type: "thermal:chiller",
            ingredient: {
                fluid: "resourcefulbees:honey",
                amount: 1000
            },
            result: [
                {
                    item: "minecraft:honey_block"
                }
            ]
        });

        // Ore processing fixes
        var enrichmentChamberOreRecipes = [
            ["forge:ores/nickel", "thermal:nickel_dust"],
            ["forge:ores/silver", "thermal:silver_dust"],
            ["forge:ores/aluminum", "silents_mechanisms:aluminum_dust"],
            ["forge:ores/yellorite", "bigreactors:yellorium_dust"]
        ];

        var bothOreRecipes = [["forge:ores/bismuth", "silents_mechanisms:bismuth_dust"]];

        for (r in enrichmentChamberOreRecipes.concat(bothOreRecipes)) {
            event.custom({
                type: "mekanism:enriching",
                input: {
                    ingredient: {
                        tag: r[0]
                    }
                },
                output: {
                    item: r[1],
                    count: 2
                }
            });
        }

        for (r in bothOreRecipes) {
            event.custom({
                type: "thermal:pulverizer",
                ingredient: {
                    tag: r[0]
                },
                result: [
                    {
                        item: r[1],
                        chance: 2.0
                    },
                    {
                        item: "minecraft:gravel",
                        chance: 0.2
                    }
                ]
            });
        }
    }

    static function replaceInputs(event:RecipesEvent) {
        // ALM Fixes
        var almFixesFilter = {mod: "assemblylinemachines"};
        event.replaceInput(almFixesFilter, "assemblylinemachines:steel_ingot", "#forge:ingots/steel");
        event.replaceInput(almFixesFilter, "assemblylinemachines:steel_plate", "#forge:plates/steel");
        event.replaceInput(almFixesFilter, "assemblylinemachines:steel_rod", "#forge:rods/steel");
        event.replaceInput(almFixesFilter, "assemblylinemachines:plastic_sheet", "#forge:plastic");
        event.replaceInput(almFixesFilter, "assemblylinemachines:iron_plate", "#forge:plates/iron");

        // Silicon Fixes
        event.replaceInput({}, "refinedstorage:silicon", "#forge:silicon");
        event.replaceInput({}, "appliedenergistics2:silicon", "#forge:silicon");
    }
}
