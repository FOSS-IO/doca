public class Container {

    public Image image { get; private set; }
    public Process process { get; private set; }
    
    public Container (Image image, Process process) {
        this.image = image;
        this.process = process;
    }

    public string to_string () {
        return @"Container(image=$image, process=$process)";
    }

}
