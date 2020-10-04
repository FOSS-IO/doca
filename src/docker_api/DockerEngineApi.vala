public class DockerEngineApi : Object, IDockerEngineApi {

    public new List<Image> list_all_images () {
        string stdout;
        List<Image> images = new List<Image> ();

        try {
            GLib.Process.spawn_command_line_sync ("""docker images --format "{{.ID}};{{.Repository}};{{.Tag}};{{.Digest}};{{.CreatedSince}};{{.CreatedAt}};{{.Size}}" """, out stdout);

            var image_lines = stdout.split ("\n");

            foreach (string image_item in image_lines) {
                var properties = image_item.split (";");
                images.append (new Image (
                    properties[0],
                    properties[1],
                    properties[2],
                    properties[3],
                    properties[4],
                    properties[5],
                    properties[6]
                ));
            }
        } catch (SpawnError e) {
            error ("Error: %s\n", e.message);
        }

        return images;
    }

    public new List<Process> list_all_processes () {
        string stdout;
        List<Process> processes = new List<Process> ();

        try {
            GLib.Process.spawn_command_line_sync ("""docker ps --format "{{.ID}};{{.Image}};{{.Command}};{{.CreatedAt}};{{.RunningFor}};{{.Ports}};{{.Status}};{{.Size}};{{.Names}};{{.Labels}};{{.Mounts}};{{.Networks}}" """, out stdout);

            var process_lines = stdout.split ("\n");

            foreach (string process_item in process_lines) {
                var properties = process_item.split (";");
                processes.append (new Process (
                    properties[0],
                    properties[1],
                    properties[2],
                    properties[3],
                    properties[4],
                    properties[5],
                    properties[6],
                    properties[7],
                    properties[8],
                    properties[9],
                    properties[10],
                    properties[11]
                ));
            }
        } catch (SpawnError e) {
            error ("Error: %s\n", e.message);
        }

        return processes;
    }

    public new List<Stats> list_all_stats () {
        string stdout;
        List<Stats> stats = new List<Stats> ();

        try {
            GLib.Process.spawn_command_line_sync ("""docker stats --no-stream --format "{{.Container}};{{.Name}};{{.ID}};{{.CPUPerc}};{{.MemUsage}};{{.NetIO}};{{.BlockIO}};{{.MemPerc}};{{.PIDs}}" """, out stdout);

            var stats_lines = stdout.split ("\n");

            foreach (string stats_item in stats_lines) {
                var properties = stats_item.split (";");
                stats.append (new Stats (
                    properties[0],
                    properties[1],
                    properties[2],
                    properties[3],
                    properties[4],
                    properties[5],
                    properties[6],
                    properties[7],
                    properties[8]
                ));
            }
        } catch (SpawnError e) {
            error ("Error: %s\n", e.message);
        }

        return stats;
    }

}
