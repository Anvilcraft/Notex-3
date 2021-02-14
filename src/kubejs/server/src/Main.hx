package;

import kubejs.Events;
import kubejs.Settings;
import kubejs.events.GeneralEvents.RecipesEvent;
import kubejs.Events.EventType;
import kubejs.Item;

class Main {
    static function main() {
        Settings.logAddedRecipes = true;
        Settings.logRemovedRecipes = true;
        Settings.logSkippedRecipes = false;
        Settings.logErroringRecipes = true;

        Events.onEvent(EventType.RecipesEventType, onRecipesEvent);
    }

    static function onRecipesEvent(event:RecipesEvent) {
        // @formatter:off
        var removeByOutput = [
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
            "ring_of_blink:ring_of_blink"
        ];
        // @formatter:on
        for (i in removeByOutput) {
            event.remove({output: i});
        }

        // SHAPED RECIPES
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

        // SHAPELESS RECIPES
        event.shapeless("ring_of_blink:ring_of_blink", ["ring_of_teleport:ring_of_teleport", "botania:terrasteel_ingot"]);
    }
}
