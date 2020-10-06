namespace Doca.Entity {

    public class Process {

        public string id { get; private set; }
        public string image_id { get; private set; }
        public string command { get; private set; }
        public string created_at { get; private set; }
        public string running_for { get; private set; }
        public string ports { get; private set; }
        public string status { get; private set; }
        public string size { get; private set; }
        public string names { get; private set; }
        public string labels { get; private set; }
        public string mounts { get; private set; }
        public string networks { get; private set; }

        public Process (string id, string image_id, string command, string created_at, string running_for,
                        string ports, string status, string size, string names, string labels, string mounts,
                        string networks) {
            this.id = id;
            this.image_id = image_id;
            this.command = command;
            this.created_at = created_at;
            this.running_for = running_for;
            this.ports = ports;
            this.status = status;
            this.size = size;
            this.names = names;
            this.labels = labels;
            this.mounts = mounts;
            this.networks = networks;
        }

        public string to_string () {
            return @"Process(id=\"$id\", image_id=\"$image_id\", command=\"$command\", created_at=\"$created_at\", running_for=\"$running_for\", ports=\"$ports\", status=\"$status\", size=\"$size\", names=\"$names\", labels=\"$labels\", mounts=\"$mounts\", networks=\"$networks\")";
        }

    }

}
