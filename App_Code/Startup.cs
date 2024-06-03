using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_20190522.Startup))]
namespace _20190522
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
