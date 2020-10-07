namespace Doca.Entity {

    public class Container {

        public Image image { get; private set; }
        public Process? process { get; private set; }
        public Stats? stats { get; private set; }

        public Container (Image image, Process? process, Stats? stats) {
            this.image = image;
            this.process = process;
            this.stats = stats;
        }

        public string to_string () {
            return @"Container(\n\timage=$image,\n\tprocess=$process,stats=$stats)";
        }

    }

}
