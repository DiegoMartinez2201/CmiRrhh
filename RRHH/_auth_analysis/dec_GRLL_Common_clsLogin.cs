using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using GRLL.Common.My;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.CompilerServices;

namespace GRLL.Common;

public class clsLogin
{
	private static string _Servidor = "";

	private static string _BaseDatos = "";

	private static string _Usuario = "";

	private static string _Password = "";

	private static bool _AutenticacionIntegrada = true;

	private SqlConnection _Cn;

	private static string _PathIniFile = "";

	public string Servidor
	{
		get
		{
			return _Servidor;
		}
		set
		{
			_Servidor = value.Trim();
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
			_BaseDatos = value.Trim();
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
			_Usuario = value.Trim();
		}
	}

	public string Password
	{
		get
		{
			return _Password;
		}
		set
		{
			_Password = value.Trim();
		}
	}

	public bool AutenticacionIntegrada
	{
		get
		{
			return _AutenticacionIntegrada;
		}
		set
		{
			_AutenticacionIntegrada = value;
		}
	}

	public string StrConnectionSql
	{
		get
		{
			string cCad = "Persist Security Info=True";
			cCad = cCad + ";Data Source=" + _Servidor + "";
			cCad = cCad + ";Initial Catalog=" + _BaseDatos;
			cCad = cCad + ";User ID=" + _Usuario;
			cCad = cCad + ";Password=" + _Password;
			return cCad + ";Connection Timeout=60";
		}
	}

	public string StrConnectionSqlIntegrated
	{
		get
		{
			string cCad = "Persist Security Info=False;Integrated Security=SSPI";
			cCad = cCad + ";Data Source=" + _Servidor + "";
			cCad = cCad + ";Initial Catalog=" + _BaseDatos;
			return cCad + ";Connection Timeout=60";
		}
	}

	// C# has no syntax for parameterized property 'StrConnection'.
	public string get_StrConnection(bool bIntegrada = false)
	{
		string cCad = "";
		if (bIntegrada)
		{
			cCad = "Persist Security Info=False;Integrated Security=SSPI";
			cCad = cCad + ";Data Source= " + _Servidor + "";
			cCad = cCad + ";Initial Catalog=" + _BaseDatos;
			cCad += ";Connection Timeout=60";
		}
		else if (!string.IsNullOrEmpty(_Usuario))
		{
			cCad = "Persist Security Info=True";
			cCad = cCad + ";Data Source= " + _Servidor + "";
			cCad = cCad + ";Initial Catalog=" + _BaseDatos;
			cCad = cCad + ";User ID=" + _Usuario;
			cCad = cCad + ";Password=" + _Password;
			cCad += ";Connection Timeout=60";
		}
		return cCad;
	}

	public SqlConnection Connection => _Cn;

	public bool Conectado => _Cn.State == ConnectionState.Open;

	public string PathFile
	{
		get
		{
			return _PathIniFile;
		}
		set
		{
			_PathIniFile = value;
		}
	}

	public static string CadenaConexion
	{
		get
		{
			if (_AutenticacionIntegrada)
			{
				string text = "Persist Security Info=False;Integrated Security=SSPI";
				text = text + ";Data Source=" + _Servidor + "";
				text = text + ";Initial Catalog=" + _BaseDatos;
				return text + ";Connection Timeout=60";
			}
			string cCad = "Persist Security Info=True";
			cCad = cCad + ";Data Source=" + _Servidor + "";
			cCad = cCad + ";Initial Catalog=" + _BaseDatos;
			cCad = cCad + ";User ID=" + _Usuario;
			cCad = cCad + ";Password=" + _Password;
			return cCad + ";Connection Timeout=60";
		}
	}

	[DllImport("kernel32", CharSet = CharSet.Ansi, EntryPoint = "GetPrivateProfileSectionNamesA", ExactSpelling = true, SetLastError = true)]
	private static extern int GetPrivateProfileSectionNames([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpszReturnBuffer, int nSize, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpFileName);

	[DllImport("kernel32", CharSet = CharSet.Ansi, EntryPoint = "GetPrivateProfileSectionA", ExactSpelling = true, SetLastError = true)]
	private static extern int GetPrivateProfileSection([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpAppName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpReturnedString, int nSize, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpFileName);

	[DllImport("kernel32", CharSet = CharSet.Ansi, EntryPoint = "WriteProfileSectionA", ExactSpelling = true, SetLastError = true)]
	private static extern int WriteProfileSection([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpAppName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpString);

	[DllImport("kernel32", CharSet = CharSet.Ansi, EntryPoint = "GetPrivateProfileStringA", ExactSpelling = true, SetLastError = true)]
	private static extern int GetPrivateProfileString([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpApplicationName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpKeyName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpDefault, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpReturnedString, int nSize, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpFileName);

	[DllImport("kernel32", CharSet = CharSet.Ansi, EntryPoint = "GetPrivateProfileStringA", ExactSpelling = true, SetLastError = true)]
	private static extern int GetPrivateProfileString([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpApplicationName, int lpKeyName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpDefault, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpReturnedString, int nSize, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpFileName);

	[DllImport("kernel32", CharSet = CharSet.Ansi, EntryPoint = "WritePrivateProfileStringA", ExactSpelling = true, SetLastError = true)]
	private static extern int WritePrivateProfileString([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpApplicationName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpKeyName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpString, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpFileName);

	[DllImport("kernel32", CharSet = CharSet.Ansi, EntryPoint = "WritePrivateProfileStringA", ExactSpelling = true, SetLastError = true)]
	private static extern int WritePrivateProfileString([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpApplicationName, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpKeyName, int lpString, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpFileName);

	[DllImport("kernel32", CharSet = CharSet.Ansi, EntryPoint = "WritePrivateProfileStringA", ExactSpelling = true, SetLastError = true)]
	private static extern int WritePrivateProfileString([MarshalAs(UnmanagedType.VBByRefStr)] ref string lpApplicationName, int lpKeyName, int lpString, [MarshalAs(UnmanagedType.VBByRefStr)] ref string lpFileName);

	public string LeerIniFile(string cFile, string sSection, string sKey)
	{
		string cValue = Strings.Space(255);
		if (File.Exists(cFile))
		{
			string lpDefault = "?";
			long nRet = GetPrivateProfileString(ref sSection, ref sKey, ref lpDefault, ref cValue, 254, ref cFile);
			return ModFunciones.Left(cValue, checked((int)nRet));
		}
		return "";
	}

	public void EscribeIniFile(string cFile, string sSection, string sKey, string sValue)
	{
		string sTemp = sValue;
		int num = Strings.Len(sValue);
		int n;
		for (n = 1; n <= num; n = checked(n + 1))
		{
			if ((Operators.CompareString(Strings.Mid(sValue, n, 1), "\r", TextCompare: false) == 0) | (Operators.CompareString(Strings.Mid(sValue, n, 1), "\n", TextCompare: false) == 0))
			{
				StringType.MidStmtStr(ref sValue, n, int.MaxValue, " ");
			}
		}
		n = WritePrivateProfileString(ref sSection, ref sKey, ref sValue, ref cFile);
	}

	public clsLogin()
	{
		_Cn = new SqlConnection();
	}

	public clsLogin(string Servidor, string BaseDatos, string Usuario, string Password, bool AutenticacionIntegrada, string PathIniFIle = null)
	{
		_Cn = new SqlConnection();
		_Servidor = Servidor;
		_BaseDatos = BaseDatos;
		_Usuario = Usuario;
		_Password = Password;
		_PathIniFile = PathIniFIle;
	}

	public bool ConectarSql(bool bIntegrada = true)
	{
		bool bResult = false;
		if (string.IsNullOrEmpty(_Servidor) || string.IsNullOrEmpty(_BaseDatos))
		{
			goto IL_0096;
		}
		if (_Cn.State == ConnectionState.Open)
		{
			_Cn.Close();
		}
		string cCad;
		if (_AutenticacionIntegrada)
		{
			cCad = StrConnectionSqlIntegrated;
		}
		else
		{
			if (string.IsNullOrEmpty(_Usuario))
			{
				goto IL_0096;
			}
			cCad = StrConnectionSql;
		}
		try
		{
			_Cn.ConnectionString = cCad;
			_Cn.Open();
			bResult = true;
		}
		catch (Exception ex)
		{
			ProjectData.SetProjectError(ex);
			Exception ex2 = ex;
			MessageBox.Show("Error al conectarse a la BD");
			ProjectData.ClearProjectError();
		}
		finally
		{
		}
		return bResult;
		IL_0096:
		bool ConectarSql = default(bool);
		return ConectarSql;
	}

	public void LoadFromIni(string oFile)
	{
		if (_PathIniFile.Trim().Length == 0)
		{
			_PathIniFile = oFile;
		}
		if (_PathIniFile.Length != 0)
		{
			if (!File.Exists(PathFile))
			{
				CreateIniFile();
			}
			_Usuario = LeerIniFile(_PathIniFile, "Settings", "Usuario");
			if (Operators.CompareString(_Usuario, "?", TextCompare: false) == 0)
			{
				CreateIniFile();
				_Usuario = LeerIniFile(_PathIniFile, "Settings", "Usuario");
			}
			_BaseDatos = LeerIniFile(_PathIniFile, "Settings", "BaseDatos");
			_Servidor = LeerIniFile(_PathIniFile, "Settings", "Servidor");
			_AutenticacionIntegrada = Conversions.ToBoolean(Interaction.IIf(Operators.CompareString(LeerIniFile(_PathIniFile, "Settings", "AutenticacionIntegrada").ToUpper(), "TRUE", TextCompare: false) == 0, true, false));
		}
	}

	public void WriteToIni()
	{
		if (_PathIniFile.Length != 0)
		{
			if (!File.Exists(_PathIniFile))
			{
				CreateIniFile();
			}
			EscribeIniFile(_PathIniFile, "Settings", "Usuario", _Usuario);
			EscribeIniFile(_PathIniFile, "Settings", "BaseDatos", _BaseDatos);
			EscribeIniFile(_PathIniFile, "Settings", "Servidor", _Servidor);
			EscribeIniFile(_PathIniFile, "Settings", "AutenticacionIntegrada", Conversions.ToString(Interaction.IIf(_AutenticacionIntegrada, "TRUE", "FALSE")));
		}
	}

	private bool CreateIniFile()
	{
		bool CreateIniFile;
		try
		{
			if (_PathIniFile.Length == 0)
			{
				CreateIniFile = false;
			}
			else
			{
				if (File.Exists(_PathIniFile))
				{
					File.Delete(_PathIniFile);
				}
				StreamWriter wFile = File.CreateText(_PathIniFile);
				string AppD = Environment.CurrentDirectory;
				wFile.WriteLine("[Settings]");
				if (Operators.CompareString(Usuario, "", TextCompare: false) == 0)
				{
					Usuario = Environment.UserName;
				}
				wFile.WriteLine("Usuario=" + Usuario);
				if (Operators.CompareString(Servidor, "", TextCompare: false) == 0)
				{
					Servidor = MyProject.Computer.Name;
				}
				wFile.WriteLine("Servidor=" + Servidor);
				if (Operators.CompareString(BaseDatos, "", TextCompare: false) == 0)
				{
					BaseDatos = "CMI";
				}
				wFile.WriteLine("BaseDatos=" + BaseDatos);
				wFile.WriteLine("AutenticacionIntegrada=" + Conversions.ToString(AutenticacionIntegrada));
				wFile.WriteLine("");
				wFile.WriteLine("[Proceso]");
				wFile.WriteLine("Area=01");
				wFile.Close();
				wFile = null;
				CreateIniFile = true;
			}
		}
		catch (Exception ex)
		{
			ProjectData.SetProjectError(ex);
			Exception ex2 = ex;
			CreateIniFile = false;
			ProjectData.ClearProjectError();
		}
		return CreateIniFile;
	}

	public void CloseCn()
	{
	}
}
