using Doca.Entity;
using Doca.Os;
using Doca.Os.Adapter;
using Doca.Service.Adapter;

namespace Doca.Service {

    public class DistributionService : Object, IDistributionService {

        private IDistributionInfo distributionInfo;

        construct {
            distributionInfo = new DistributionInfo ();
        }

        public new Distribution get_distro () {
            return distributionInfo.get_distro ();
        }

    }

}
