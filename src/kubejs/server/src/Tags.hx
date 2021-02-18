package;

import kubejs.events.server.TagsEvent;

class Tags {
    public static function onItemTagsEvent(event:TagsEvent) {
        itemAndBlockTags(event);
        itemTags(event);
    }

    public static function onBlockTagsEvent(event:TagsEvent) {
        itemAndBlockTags(event);
    }

    static function itemAndBlockTags(event:TagsEvent) {
        // Fix ore tags
        event.add("forge:ores/copper", ["electrodynamics:orecopper"]);
        event.add("forge:ores/tin", ["electrodynamics:oretin"]);
        event.add("forge:ores/silver", ["electrodynamics:oresilver"]);
        event.add("forge:ores/lead", ["electrodynamics:orelead"]);
        event.add("forge:ores/sulfur", ["electrodynamics:oresulfur"]);

        event.add("forge:ores/yellorite", ["bigreactors:yellorite_ore"]);

        // Trapdoor tags
        var trapdoors = ["ars_nouveau:archwood_trapdoor", "rats:pirat_trapdoor"];
        event.add("minecraft:trapdoors", trapdoors);
        event.add("minecraft:wooden_trapdoors", trapdoors);
    }

    static function itemTags(event:TagsEvent) {
        event.add("forge:plates/iron", ["assemblylinemachines:iron_plate"]);
        event.add("forge:plates/steel", ["assemblylinemachines:steel_plate"]);
        event.add("forge:plastic", ["assemblylinemachines:plastic_sheet"]);
    }
}
