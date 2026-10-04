package place.dreamy.spongemvnex;

import org.apache.logging.log4j.Logger;
import org.spongepowered.api.Server;
import org.spongepowered.api.event.Listener;
import org.spongepowered.api.event.lifecycle.StartedEngineEvent;
import org.spongepowered.plugin.builtin.jvm.Plugin;

// Imports for logger
import com.google.inject.Inject;

// Have a look here: https://docs.spongepowered.org/stable/en/plugin/plugin-class.html
@Plugin("spongemvnex")
public class SpongeMvnEx {

    @Inject
    private Logger logger;

    @Listener
    public void onServerStart(final StartedEngineEvent<Server> event) {
        logger.info("Successfully running the Sponge Maven Example Plugin!");
    }
}
