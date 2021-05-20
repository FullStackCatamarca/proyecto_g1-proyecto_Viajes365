using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebViajes365.Startup))]
namespace WebViajes365
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
