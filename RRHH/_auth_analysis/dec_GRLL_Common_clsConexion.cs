using System;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using Microsoft.VisualBasic.CompilerServices;

namespace GRLL.Common;

public class clsConexion
{
	public delegate void ConfigurationChangedEventHandler();

	[AccessedThroughProperty("_Configuracion")]
	private static SQLConfiguracion __Configuracion;

	private static SqlConnection _Cn;

	private static string _CadenaConexion;

	private static SQLConfiguracion _Configuracion
	{
		[DebuggerNonUserCode]
		get
		{
			return __Configuracion;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			SQLConfiguracion.ValueChangedEventHandler obj = _Configuracion_ValueChanged;
			if (__Configuracion != null)
			{
				__Configuracion.ValueChanged -= obj;
			}
			__Configuracion = value;
			if (__Configuracion != null)
			{
				__Configuracion.ValueChanged += obj;
			}
		}
	}

	public static SQLConfiguracion Configuracion
	{
		get
		{
			if (_Configuracion == null)
			{
				_Configuracion = new SQLConfiguracion();
			}
			return _Configuracion;
		}
		set
		{
			_Configuracion = value;
		}
	}

	public static SqlConnection Conexion
	{
		get
		{
			if (_Cn == null)
			{
				SQL_AbrirConexion();
			}
			return _Cn;
		}
		set
		{
			_Cn = value;
		}
	}

	[method: DebuggerNonUserCode]
	public static event ConfigurationChangedEventHandler ConfigurationChanged;

	private void cambiaConfig()
	{
		ConfigurationChanged?.Invoke();
	}

	public clsConexion(SQLConfiguracion Config)
	{
		_Configuracion = Config;
	}

	public clsConexion(string CadenaConexion)
	{
		_CadenaConexion = CadenaConexion;
	}

	public clsConexion(string Servidor, string BaseDatos, bool AutenticacionIntegrada, string Usuario, string Password)
	{
		_Configuracion = new SQLConfiguracion
		{
			Servidor = Servidor,
			BaseDatos = BaseDatos,
			AutenticacionIntegrada = AutenticacionIntegrada,
			Usuario = Usuario,
			Password = Password
		};
	}

	public clsConexion(string Servidor, string BaseDatos, bool AutenticacionIntegrada, string Usuario, string Password, int TiempoConexion)
	{
		_Configuracion = new SQLConfiguracion
		{
			Servidor = Servidor,
			BaseDatos = BaseDatos,
			AutenticacionIntegrada = AutenticacionIntegrada,
			Usuario = Usuario,
			Password = Password,
			TiempoConexion = TiempoConexion
		};
	}

	public static void AddConfiguracion(SQLConfiguracion Config)
	{
		_Configuracion = Config;
		ConfigurationChanged?.Invoke();
	}

	public static SqlConnection SQL_AbrirConexion()
	{
		try
		{
			CrearCadenaConexion();
			if (_Cn == null)
			{
				_Cn = new SqlConnection(_CadenaConexion);
			}
			if (_Cn.State == ConnectionState.Closed)
			{
				_Cn.ConnectionString = _CadenaConexion;
			}
			if (_Cn.State != ConnectionState.Open)
			{
				_Cn.Open();
			}
			return _Cn;
		}
		catch (SqlException ex)
		{
			ProjectData.SetProjectError(ex);
			SqlException ex2 = ex;
			throw new Exception(ex2.Message);
		}
		catch (Exception ex3)
		{
			ProjectData.SetProjectError(ex3);
			Exception ex4 = ex3;
			throw new Exception(ex4.Message);
		}
	}

	public static SqlTransaction SQL_IniciarTransaccion()
	{
		try
		{
			CrearCadenaConexion();
			if (_Cn == null)
			{
				_Cn = new SqlConnection(_CadenaConexion);
			}
			if (_Cn.State == ConnectionState.Closed)
			{
				_Cn.ConnectionString = _CadenaConexion;
			}
			if (_Cn.State != ConnectionState.Open)
			{
				_Cn.Open();
			}
			return _Cn.BeginTransaction();
		}
		catch (SqlException ex)
		{
			ProjectData.SetProjectError(ex);
			SqlException ex2 = ex;
			throw new Exception(ex2.Message);
		}
		catch (Exception ex3)
		{
			ProjectData.SetProjectError(ex3);
			Exception ex4 = ex3;
			throw new Exception(ex4.Message);
		}
	}

	public static void SetTransactionInCommand(SqlCommand SqlCmd, SqlTransaction SqlT)
	{
		try
		{
			SqlCmd.Transaction = SqlT;
		}
		catch (SqlException ex)
		{
			ProjectData.SetProjectError(ex);
			SqlException ex2 = ex;
			throw new Exception(ex2.Message);
		}
		catch (Exception ex3)
		{
			ProjectData.SetProjectError(ex3);
			Exception ex4 = ex3;
			throw new Exception(ex4.Message);
		}
	}

	public static void SQL_ConfirmarTransaccion(SqlTransaction SqlT)
	{
		try
		{
			SqlT.Commit();
		}
		catch (SqlException ex)
		{
			ProjectData.SetProjectError(ex);
			SqlException ex2 = ex;
			throw new Exception(ex2.Message);
		}
		catch (Exception ex3)
		{
			ProjectData.SetProjectError(ex3);
			Exception ex4 = ex3;
			throw new Exception(ex4.Message);
		}
	}

	public static void SQL_DeshacerTransaccion(SqlTransaction SqlT)
	{
		try
		{
			SqlT.Rollback();
		}
		catch (SqlException ex)
		{
			ProjectData.SetProjectError(ex);
			SqlException ex2 = ex;
			throw new Exception(ex2.Message);
		}
		catch (Exception ex3)
		{
			ProjectData.SetProjectError(ex3);
			Exception ex4 = ex3;
			throw new Exception(ex4.Message);
		}
	}

	public static string GetCadenaConexion()
	{
		return _CadenaConexion;
	}

	private static void CrearCadenaConexion()
	{
		if (_Configuracion == null)
		{
			if (_CadenaConexion == null || _CadenaConexion.Length == 0)
			{
				throw new Exception("No ha inicializado los parámetros de Conexión");
			}
			return;
		}
		SQLConfiguracion configuracion = _Configuracion;
		if (configuracion.AutenticacionIntegrada)
		{
			_CadenaConexion = "Server=" + configuracion.Servidor;
			_CadenaConexion = _CadenaConexion + ";Database=" + configuracion.BaseDatos;
			_CadenaConexion += ";Integrated Security=True";
			_CadenaConexion = _CadenaConexion + ";Connection TimeOut=" + configuracion.TiempoConexion + ";";
		}
		else
		{
			_CadenaConexion = "Server=" + configuracion.Servidor;
			_CadenaConexion = _CadenaConexion + ";Database=" + configuracion.BaseDatos;
			_CadenaConexion = _CadenaConexion + ";User Id=" + configuracion.Usuario;
			_CadenaConexion = _CadenaConexion + ";Password=" + configuracion.Password;
			_CadenaConexion = _CadenaConexion + ";Connection TimeOut=" + configuracion.TiempoConexion + ";";
		}
		configuracion = null;
	}

	public static void SQL_CerrarConexion()
	{
		if (_Cn != null && _Cn.State != ConnectionState.Closed)
		{
			_Cn.Close();
		}
	}

	private static void _Configuracion_ValueChanged()
	{
		ConfigurationChanged?.Invoke();
	}
}
