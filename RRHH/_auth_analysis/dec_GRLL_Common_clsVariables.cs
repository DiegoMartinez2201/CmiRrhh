using System.Diagnostics;

namespace GRLL.Common;

public class clsVariables
{
	public enum MenuTv
	{
		NuevoP,
		Nuevo,
		Modificar,
		Eliminar,
		Consultar,
		NuevoH
	}

	public enum TipoDato
	{
		NumeroEntero = 1,
		NumeroConSigno,
		NumeroSinSigno,
		LetrasSinEspacio,
		LetrasConEspacio,
		LetrasyNumeros,
		Fecha,
		Todo,
		Direccion,
		Email,
		Fonos
	}

	[DebuggerNonUserCode]
	public clsVariables()
	{
	}
}
