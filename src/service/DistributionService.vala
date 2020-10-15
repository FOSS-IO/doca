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

        public async new Distribution get_distro () {
            return yield distributionInfo.get_distro ();
        }

    }

}
