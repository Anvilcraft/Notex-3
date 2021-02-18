package;

import kubejs.Events;
import kubejs.Settings;
import kubejs.events.server.RecipesEvent;
import kubejs.Events.EventType;

class Main {
    static function main() {
        Settings.logAddedRecipes = true;
        Settings.logRemovedRecipes = true;
        Settings.logSkippedRecipes = false;
        Settings.logErroringRecipes = true;

        Events.onEvent(EventType.RecipesEventType, Recipes.onEvent);
        Events.onEvent(EventType.ItemTagsEventType, Tags.onItemTagsEvent);
        Events.onEvent(EventType.BlockTagsEventType, Tags.onBlockTagsEvent);
    }
}
