namespace Doca.Entity {

    public class Stats {

        public string container_id { get; private set; }
        public string name { get; private set; }
        public string id { get; private set; }
        public string cpu_perc { get; private set; }
        public string mem_usage { get; private set; }
        public string net_io { get; private set; }
        public string block_io { get; private set; }
        public string mem_perc { get; private set; }
        public string pids { get; private set; }

        public Stats (string container_id, string name, string id, string cpu_perc, string mem_usage,
                        string net_io, string block_io, string mem_perc, string pids) {
            this.container_id = container_id;
            this.name = name;
            this.id = id;
            this.cpu_perc = cpu_perc;
            this.mem_usage = mem_usage;
            this.net_io = net_io;
            this.block_io = container_id;
            this.mem_perc = mem_perc;
            this.pids = pids;
        }

        public string to_string () {
            return @"Stats(container_id=\"$container_id\", name=\"$name\", id=\"$id\", cpu_perc=\"$cpu_perc\", mem_usage=\"$mem_usage\", net_io=\"$net_io\", block_io=\"$block_io\", mem_perc=\"$mem_perc\", pids=\"$pids\")";
        }

    }

}
