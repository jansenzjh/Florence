using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Florence.Startup))]
namespace Florence
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
