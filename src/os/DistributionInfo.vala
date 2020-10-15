using Doca.Entity;
using Doca.Os.Adapter;

namespace Doca.Os {

    public class DistributionInfo : Object, IDistributionInfo {

        public async new Distribution get_distro () {
            string stdout;

            try {
                GLib.Process.spawn_command_line_sync ("uname -a", out stdout);
                var distro = stdout.down ();

                if (distro.contains ("elementary")) {
                    return Distribution.ELEMENTARY;
                } else if (distro.contains ("ubuntu")) {
                    return Distribution.UBUNTU;
                } else if (distro.contains ("manjaro")) {
                    return Distribution.MANJARO;
                } else {
                    return Distribution.UNKNOWN;
                }
            } catch (SpawnError e) {
                error ("Error: %s\n", e.message);
            }
        }

    }

}
