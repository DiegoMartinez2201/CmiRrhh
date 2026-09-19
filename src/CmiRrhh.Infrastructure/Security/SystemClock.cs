using CmiRrhh.Application.Abstractions;

namespace CmiRrhh.Infrastructure.Security;

public sealed class SystemClock : IClock
{
    public DateTime UtcNow => DateTime.UtcNow;
}
