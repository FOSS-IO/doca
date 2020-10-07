namespace Doca.Entity {

    public class Image {

        public string id { get; private set; }
        public string repository { get; private set; }
        public string tag { get; private set; }
        public string digest { get; private set; }
        public string created_since { get; private set; }
        public string created_at { get; private set; }
        public string size { get; private set; }

        public string repository_tag { owned get { return @"$repository:$tag"; } }

        public Image(string id, string repository, string tag, string digest, string created_since, string created_at, string size) {
            this.id = id;
            this.repository = repository;
            this.tag = tag;
            this.digest = digest;
            this.created_since = created_since;
            this.created_at = created_at;
            this.size = size;
        }

        public string to_string () {
            return @"Image(id=\"$id\", repository=\"$repository\", tag=\"$tag\", digest=\"$digest\", created_since=\"$created_since\", created_at=\"$created_at\", size=\"$size\")";
        }

    }

}
