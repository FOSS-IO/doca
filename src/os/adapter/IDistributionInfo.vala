using Doca.Entity;

namespace Doca.Os.Adapter {

    public interface IDistributionInfo : Object {

        public async abstract Distribution get_distro ();

    }

}
