using Doca.Service;
using Doca.Service.Adapter;

namespace Doca {

    public class Main {

        public static int main (string[] args) {
            new Doca.Service.ContainerService ().list_all_containers ();
            var app = new Application ();
            return app.run (args);
        }

    }

}
