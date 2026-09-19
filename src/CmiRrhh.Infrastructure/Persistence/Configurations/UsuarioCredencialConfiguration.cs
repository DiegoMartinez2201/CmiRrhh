using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace CmiRrhh.Infrastructure.Persistence.Configurations;

public sealed class UsuarioCredencialConfiguration : IEntityTypeConfiguration<UsuarioCredencial>
{
    public void Configure(EntityTypeBuilder<UsuarioCredencial> builder)
    {
        builder.ToTable("Usuario_Credencial");

        builder.HasKey(e => e.IdUsuario);

        builder.Property(e => e.IdUsuario).ValueGeneratedNever();

        builder.Property(e => e.PasswordHash)
            .HasMaxLength(500)
            .IsRequired();

        builder.Property(e => e.RequiereCambioPassword)
            .IsRequired();

        builder.Property(e => e.IntentosFallidos)
            .HasDefaultValue(0)
            .IsRequired();

        builder.Property(e => e.FechaBloqueo)
            .HasColumnType("datetime");

        builder.HasOne(e => e.Usuario)
            .WithOne(u => u.Credencial)
            .HasForeignKey<UsuarioCredencial>(e => e.IdUsuario)
            .OnDelete(DeleteBehavior.Cascade)
            .HasConstraintName("FK_Usuario_Credencial_Usuario");
    }
}
