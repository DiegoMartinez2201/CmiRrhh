using System.Diagnostics;

namespace GRLL.Common;

public class SettingLogin
{
	private string _Servidor;

	private string _BaseDatos;

	private string _Usuario;

	private bool _SeguridadIntegrada;

	public bool SeguridadIntegrada
	{
		get
		{
			return _SeguridadIntegrada;
		}
		set
		{
			_SeguridadIntegrada = value;
		}
	}

	public string Usuario
	{
		get
		{
			return _Usuario;
		}
		set
		{
			_Usuario = value;
		}
	}

	public string BaseDatos
	{
		get
		{
			return _BaseDatos;
		}
		set
		{
			_BaseDatos = value;
		}
	}

	public string Servidor
	{
		get
		{
			return _Servidor;
		}
		set
		{
			_Servidor = value;
		}
	}

	[DebuggerNonUserCode]
	public SettingLogin()
	{
	}
}
