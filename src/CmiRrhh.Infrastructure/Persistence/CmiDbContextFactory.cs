using CmiRrhh.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;

namespace CmiRrhh.Infrastructure.Persistence;

public sealed class CmiDbContextFactory : IDesignTimeDbContextFactory<CmiDbContext>
{
    public CmiDbContext CreateDbContext(string[] args)
    {
        var current = Directory.GetCurrentDirectory();
        var webPath = Path.GetFullPath(Path.Combine(current, "..", "CmiRrhh.Web"));
        if (!Directory.Exists(webPath))
        {
            webPath = Path.GetFullPath(Path.Combine(current, "src", "CmiRrhh.Web"));
        }

        var configuration = new ConfigurationBuilder()
            .SetBasePath(webPath)
            .AddJsonFile("appsettings.json", optional: true)
            .AddJsonFile("appsettings.Development.json", optional: true)
            .Build();

        var connectionString = configuration.GetConnectionString("CMI")
            ?? "Server=.\\SQLEXPRESS;Database=CMI;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=True";

        var options = new DbContextOptionsBuilder<CmiDbContext>()
            .UseSqlServer(connectionString)
            .Options;

        return new CmiDbContext(options);
    }
}
