using CmiRrhh.Application.Abstractions;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;

namespace CmiRrhh.Application.Tests;

public class AuthenticationServiceTests
{
    [Fact]
    public async Task Login_Fails_When_Credentials_Are_Wrong()
    {
        var repo = new FakeUsuarioAccesoRepository();
        var hasher = new FakePasswordHasher();
        var clock = new FakeClock(new DateTime(2026, 9, 17, 12, 0, 0, DateTimeKind.Utc));
        var sut = new AuthenticationService(repo, hasher, clock);

        var result = await sut.LoginAsync("jperez", "incorrecta");

        Assert.False(result.Succeeded);
        Assert.False(result.IsLockedOut);
        Assert.Equal(1, repo.Credencial.IntentosFallidos);
    }

    [Fact]
    public async Task Login_Locks_After_Three_Failures()
    {
        var repo = new FakeUsuarioAccesoRepository();
        var hasher = new FakePasswordHasher();
        var clock = new FakeClock(new DateTime(2026, 9, 17, 12, 0, 0, DateTimeKind.Utc));
        var sut = new AuthenticationService(repo, hasher, clock);

        await sut.LoginAsync("jperez", "bad1");
        await sut.LoginAsync("jperez", "bad2");
        var result = await sut.LoginAsync("jperez", "bad3");

        Assert.True(result.IsLockedOut);
        Assert.Equal(3, repo.Credencial.IntentosFallidos);
        Assert.Equal(clock.UtcNow.AddMinutes(15), repo.Credencial.FechaBloqueo);
    }

    [Fact]
    public async Task Login_Succeeds_And_Resets_Failures()
    {
        var repo = new FakeUsuarioAccesoRepository();
        repo.Credencial.IntentosFallidos = 2;
        var hasher = new FakePasswordHasher();
        var clock = new FakeClock(new DateTime(2026, 9, 17, 12, 0, 0, DateTimeKind.Utc));
        var sut = new AuthenticationService(repo, hasher, clock);

        var result = await sut.LoginAsync("jperez", "secreta");

        Assert.True(result.Succeeded);
        Assert.Equal(10, result.IdEmpleado);
        Assert.Contains("ASISTENCIAS", result.Roles);
        Assert.True(result.RequiereCambioPassword);
        Assert.Equal(0, repo.Credencial.IntentosFallidos);
        Assert.Null(repo.Credencial.FechaBloqueo);
    }

    [Fact]
    public async Task ChangePassword_Clears_MustChange_Flag()
    {
        var repo = new FakeUsuarioAccesoRepository();
        var hasher = new FakePasswordHasher();
        var clock = new FakeClock(new DateTime(2026, 9, 17, 12, 0, 0, DateTimeKind.Utc));
        var sut = new AuthenticationService(repo, hasher, clock);

        await sut.ChangePasswordAsync(1, "NuevaClave#1");

        Assert.False(repo.Credencial.RequiereCambioPassword);
        Assert.Equal("hash:NuevaClave#1", repo.Credencial.PasswordHash);
    }

    private sealed class FakeClock : IClock
    {
        public FakeClock(DateTime utcNow) => UtcNow = utcNow;

        public DateTime UtcNow { get; }
    }

    private sealed class FakePasswordHasher : IPasswordHasher
    {
        public string Hash(string password) => $"hash:{password}";

        public bool Verify(string hash, string password) => hash == $"hash:{password}";
    }

    private sealed class FakeUsuarioAccesoRepository : IUsuarioAccesoRepository
    {
        public UsuarioCredencialSnapshot Credencial { get; } = new()
        {
            IdUsuario = 1,
            PasswordHash = "hash:secreta",
            RequiereCambioPassword = true,
            IntentosFallidos = 0,
            FechaBloqueo = null
        };

        public Task<UsuarioAcceso?> FindActiveByLoginAsync(string login, CancellationToken cancellationToken = default)
        {
            if (!string.Equals(login, "jperez", StringComparison.OrdinalIgnoreCase))
            {
                return Task.FromResult<UsuarioAcceso?>(null);
            }

            return Task.FromResult<UsuarioAcceso?>(new UsuarioAcceso
            {
                IdUsuario = 1,
                Login = "jperez",
                DisplayName = "Juan Perez",
                IdEmpleado = 10,
                Roles = new[] { "ASISTENCIAS" }
            });
        }

        public Task<UsuarioCredencialSnapshot?> GetCredencialAsync(int idUsuario, CancellationToken cancellationToken = default)
        {
            return Task.FromResult<UsuarioCredencialSnapshot?>(idUsuario == 1 ? Credencial : null);
        }

        public Task UpdateCredencialAsync(UsuarioCredencialSnapshot credencial, CancellationToken cancellationToken = default)
        {
            Credencial.PasswordHash = credencial.PasswordHash;
            Credencial.RequiereCambioPassword = credencial.RequiereCambioPassword;
            Credencial.IntentosFallidos = credencial.IntentosFallidos;
            Credencial.FechaBloqueo = credencial.FechaBloqueo;
            return Task.CompletedTask;
        }
    }
}
