using CmiRrhh.Infrastructure.Persistence.Configurations;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence;

public partial class CmiDbContext
{
    public virtual DbSet<UsuarioCredencial> UsuarioCredenciales { get; set; } = null!;

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder)
    {
        modelBuilder.ApplyConfiguration(new UsuarioCredencialConfiguration());

        var codeFirstTypes = new HashSet<Type> { typeof(UsuarioCredencial) };
        foreach (var entityType in modelBuilder.Model.GetEntityTypes())
        {
            if (entityType.ClrType is not null && !codeFirstTypes.Contains(entityType.ClrType))
            {
                entityType.SetIsTableExcludedFromMigrations(true);
            }
        }
    }
}
