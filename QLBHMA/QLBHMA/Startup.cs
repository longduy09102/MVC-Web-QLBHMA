using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QLBHMA.Startup))]
namespace QLBHMA
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
