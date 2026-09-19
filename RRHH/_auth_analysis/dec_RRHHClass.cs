using System;
using System.Data;
using System.Data.SqlClient;
using GRLL.Common;
using Microsoft.VisualBasic.CompilerServices;

namespace ClassRRHH;

public class RRHHClass
{
	public SqlConnection ObjCnn;

	public SqlDataAdapter objDA;

	private int mCodigoEmpleado;

	private int mAnio;

	public int CodigoEmpleado
	{
		get
		{
			return mCodigoEmpleado;
		}
		set
		{
			mCodigoEmpleado = value;
		}
	}

	public int Anio
	{
		get
		{
			return mAnio;
		}
		set
		{
			mAnio = value;
		}
	}

	public RRHHClass()
	{
		ObjCnn = clsConexion.Conexion;
		objDA = new SqlDataAdapter();
		mAnio = 2011;
	}

	public object llena_DocID()
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("Select TipoDocID,Descripcion from  TipoDocID", ObjCnn);
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public object llena_Area()
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("select idAreaOrganiz,AreaOrganizacional from dbo.EstructOrganiz where Year=" + Conversions.ToString(mAnio) + "Order by 2", ObjCnn);
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public object llena_Nacionalidad()
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("select IdNacionalidad, Descripcion from nacionalidad", ObjCnn);
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public object llena_Discapacidad()
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("Select IdDiscapacidad,Descrip_Discapacidad from  Discapacidad", ObjCnn);
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public object llena_estCivil()
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("select IdEstadoCivil,DescripEstCivil from EstadoCivil", ObjCnn);
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public int SgtIdPermiso(int idempleado)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_SgtID_Permiso", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idempleado", SqlDbType.Int).Value = idempleado;
		int result = Conversions.ToInteger(objDA.SelectCommand.ExecuteScalar());
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return result;
	}

	public int SgtIdHorarioTemporal(int idempleado)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_SgtID_HorarioTemporal", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idempleado", SqlDbType.Int).Value = idempleado;
		int result = Conversions.ToInteger(objDA.SelectCommand.ExecuteScalar());
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return result;
	}

	public bool importarBio(string FechaInicial, string FechaFinal)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("spRRHH_ImportarAsistenciaBio", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@FechaInicio", SqlDbType.VarChar).Value = FechaInicial;
		objDA.SelectCommand.Parameters.Add("@FechaFin", SqlDbType.VarChar).Value = FechaFinal;
		objDA.SelectCommand.CommandTimeout = 0;
		objDA.SelectCommand.ExecuteNonQuery();
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return true;
	}

	public int ExisteMarcacion(int idempleado, string fecha)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_Verficar_Existe_Marcacion", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idempleado", SqlDbType.Int).Value = idempleado;
		objDA.SelectCommand.Parameters.Add("@Fecha", SqlDbType.VarChar).Value = fecha;
		int result = Conversions.ToInteger(objDA.SelectCommand.ExecuteScalar());
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return result;
	}

	public int ExisteAsistencia(int idempleado, string fecha)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_Verficar_Existe_Asistencia", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idempleado", SqlDbType.Int).Value = idempleado;
		objDA.SelectCommand.Parameters.Add("@Fecha", SqlDbType.VarChar).Value = fecha;
		int result = Conversions.ToInteger(objDA.SelectCommand.ExecuteScalar());
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return result;
	}

	public bool ElimnarPermiso(int idempleado, int NPermiso)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_Elimnar_Permiso", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idempleado", SqlDbType.Int).Value = idempleado;
		objDA.SelectCommand.Parameters.Add("@NPermiso", SqlDbType.Int).Value = NPermiso;
		objDA.SelectCommand.ExecuteNonQuery();
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return true;
	}

	public bool eliminarHorarioTemporal(int idempleado, int NPermiso)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_Elimnar_HorarioTemporal", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idempleado", SqlDbType.Int).Value = idempleado;
		objDA.SelectCommand.Parameters.Add("@NPermiso", SqlDbType.Int).Value = NPermiso;
		objDA.SelectCommand.ExecuteNonQuery();
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return true;
	}

	public DataTable llenar_Empleado_Area(int idEmpleado)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("sp_GetAll_EmpleadoArea_by_idEmpleado", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idempleado", SqlDbType.Int).Value = idEmpleado;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public void Actualizar_Area_Empleado(int idEmpleado, int Anio, int idAreaOrganiz)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_Actualiza_Empleado_Area", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@IdEmpleado", SqlDbType.Int).Value = idEmpleado;
		objDA.SelectCommand.Parameters.Add("@idAreaOrganiz", SqlDbType.Int).Value = idAreaOrganiz;
		objDA.SelectCommand.Parameters.Add("@Anio", SqlDbType.Int).Value = Anio;
		objDA.SelectCommand.ExecuteNonQuery();
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
	}

	public DataTable llenar_Areas_by_año(int Anio)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("sp_GetAll_Area_By_Anio", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@Anio", SqlDbType.Int).Value = Anio;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable buscar_empleado(int? codigo, string numdoc, string apellido, int? idTipoTrabajador, int activo, int idRol = 0)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_busca_empleado", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idempleado", SqlDbType.Int).Value = codigo;
		objDA.SelectCommand.Parameters.Add("@NumdocId", SqlDbType.VarChar, 12).Value = numdoc;
		objDA.SelectCommand.Parameters.Add("@Apellido_Paterno", SqlDbType.VarChar, 30).Value = apellido;
		objDA.SelectCommand.Parameters.Add("@IdTipoTrabajador", SqlDbType.VarChar, 30).Value = idTipoTrabajador;
		objDA.SelectCommand.Parameters.Add("@Anio", SqlDbType.VarChar, 30).Value = mAnio;
		objDA.SelectCommand.Parameters.Add("@idRol", SqlDbType.Int).Value = idRol;
		objDA.SelectCommand.Parameters.Add("@activo", SqlDbType.Bit).Value = activo;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable BuscarEmpleado_Codigo(int codigo)
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_BuscarEmpleado_Codigo", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@codigo", SqlDbType.Int).Value = codigo;
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public bool ActualizaAsistencia(int idEmpleado, DateTime fecha, string hor_sal, bool flag_sal)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_Actualiza_Asistencia", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@IdEmpleado", SqlDbType.Int).Value = idEmpleado;
		objDA.SelectCommand.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = fecha;
		objDA.SelectCommand.Parameters.Add("@Hor_Sal", SqlDbType.Char, 8).Value = hor_sal;
		objDA.SelectCommand.Parameters.Add("@Flag_Sal", SqlDbType.Bit).Value = flag_sal;
		objDA.SelectCommand.ExecuteNonQuery();
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return true;
	}

	public int ExistePermiso(int idEmpleado, string FechaInicio, string FechaFin)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_ExistePermiso_Permiso", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idEmpleado", SqlDbType.Int).Value = idEmpleado;
		objDA.SelectCommand.Parameters.Add("@FechaInicio", SqlDbType.Char).Value = FechaInicio;
		objDA.SelectCommand.Parameters.Add("@FechaFin", SqlDbType.Char).Value = FechaFin;
		int result = Conversions.ToInteger(objDA.SelectCommand.ExecuteScalar());
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return result;
	}

	public void ingresa_Empleado_Area(int year, int idorganiz, int idEmpleado)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		objDA.SelectCommand = new SqlCommand("sp_Insert_Empleado_Area", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@Year", SqlDbType.Int).Value = year;
		objDA.SelectCommand.Parameters.Add("@idAreaOrganiz", SqlDbType.Int).Value = idorganiz;
		objDA.SelectCommand.Parameters.Add("@IdEmpleado", SqlDbType.Int).Value = idEmpleado;
		objDA.SelectCommand.ExecuteNonQuery();
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
	}

	public int Ingresa_Empleado(int year, int idorganiz, int TipoDocIdent, string NumDoc, string Apellido_Paterno, string Apellido_Materno, string Nombres, string ubigeoNac, DateTime fechaNac, string Direccion, string Fono, string FonoLab, string FonoCel, string FonoOtro, string Mail, string UbigeoDireccion, int idNacionalidad, string sexo, int idEstCivil, int idDiscapacidad, string expSocial, DateTime FechaIngreso, int tiposangre, string brevete, string libmilitar, string gradoinstruccion, string numRuc, int idtipoTrabajador, byte[] Foto)
	{
		ObjCnn.Open();
		objDA.SelectCommand = new SqlCommand("spRRHH_GrabarEmpleado", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		SqlParameter sqlParameter = new SqlParameter("@codEmpleNuevo", SqlDbType.Int, 32);
		sqlParameter.Direction = ParameterDirection.Output;
		objDA.SelectCommand.Parameters.Add(sqlParameter);
		objDA.SelectCommand.Parameters.Add("@year", SqlDbType.Int).Value = year;
		objDA.SelectCommand.Parameters.Add("@idorganiz", SqlDbType.Int).Value = idorganiz;
		objDA.SelectCommand.Parameters.Add("@TipoDocIdent", SqlDbType.Int).Value = TipoDocIdent;
		objDA.SelectCommand.Parameters.Add("@NumDoc", SqlDbType.Char, 12).Value = NumDoc;
		objDA.SelectCommand.Parameters.Add("@Apellido_Paterno", SqlDbType.VarChar, 30).Value = Apellido_Paterno;
		objDA.SelectCommand.Parameters.Add("@Apellido_Materno", SqlDbType.VarChar, 30).Value = Apellido_Materno;
		objDA.SelectCommand.Parameters.Add("@Nombres", SqlDbType.VarChar, 100).Value = Nombres;
		objDA.SelectCommand.Parameters.Add("@ubigeoNac", SqlDbType.Char, 6).Value = ubigeoNac;
		objDA.SelectCommand.Parameters.Add("@fechaNac", SqlDbType.DateTime).Value = fechaNac;
		objDA.SelectCommand.Parameters.Add("@Direccion", SqlDbType.VarChar, 100).Value = Direccion;
		objDA.SelectCommand.Parameters.Add("@Fono", SqlDbType.VarChar, 15).Value = Fono;
		objDA.SelectCommand.Parameters.Add("@FonoLab", SqlDbType.VarChar, 15).Value = FonoLab;
		objDA.SelectCommand.Parameters.Add("@FonoCel", SqlDbType.VarChar, 15).Value = FonoCel;
		objDA.SelectCommand.Parameters.Add("@FonoOtro", SqlDbType.VarChar, 15).Value = FonoOtro;
		objDA.SelectCommand.Parameters.Add("@Mail", SqlDbType.VarChar, 50).Value = Mail;
		objDA.SelectCommand.Parameters.Add("@UbigeoDireccion", SqlDbType.Char, 6).Value = UbigeoDireccion;
		objDA.SelectCommand.Parameters.Add("@idNacionalidad", SqlDbType.Int).Value = idNacionalidad;
		objDA.SelectCommand.Parameters.Add("@sexo", SqlDbType.Char, 1).Value = sexo;
		objDA.SelectCommand.Parameters.Add("@idEstCivil", SqlDbType.Int).Value = idEstCivil;
		objDA.SelectCommand.Parameters.Add("@idDiscapacidad", SqlDbType.Int).Value = idDiscapacidad;
		objDA.SelectCommand.Parameters.Add("@expSocial", SqlDbType.VarChar, 20).Value = expSocial;
		objDA.SelectCommand.Parameters.Add("@FechaIngreso", SqlDbType.SmallDateTime).Value = FechaIngreso;
		objDA.SelectCommand.Parameters.Add("@idtiposangre", SqlDbType.Int).Value = tiposangre;
		objDA.SelectCommand.Parameters.Add("@brevete", SqlDbType.VarChar, 12).Value = brevete;
		objDA.SelectCommand.Parameters.Add("@libmilitar", SqlDbType.VarChar, 10).Value = libmilitar;
		objDA.SelectCommand.Parameters.Add("@gradoinstrucc", SqlDbType.VarChar, 80).Value = gradoinstruccion;
		objDA.SelectCommand.Parameters.Add("@numruc", SqlDbType.VarChar, 12).Value = numRuc;
		objDA.SelectCommand.Parameters.Add("@idtipoTrabajador", SqlDbType.Int).Value = idtipoTrabajador;
		objDA.SelectCommand.Parameters.Add("@Foto", SqlDbType.Image).Value = Foto;
		objDA.SelectCommand.ExecuteNonQuery();
		ObjCnn.Close();
		return Conversions.ToInteger(sqlParameter.Value);
	}

	public void Actualiza_Empleado(int codpersona, int codempleado, int year, int idorganiz, int TipoDocIdent, string NumDoc, string Apellido_Paterno, string Apellido_Materno, string Nombres, string ubigeoNac, DateTime fechaNac, string Direccion, string Fono, string FonoLab, string FonoCel, string FonoOtro, string Mail, string UbigeoDireccion, int idNacionalidad, string sexo, int idEstCivil, int idDiscapacidad, string expSocial, DateTime FechaIngreso, int tiposangre, string brevete, string libmilitar, string gradoinstruccion, string numRuc, int idtipoTrabajador, byte[] Foto)
	{
		ObjCnn.Open();
		objDA.SelectCommand = new SqlCommand("spRRHH_ActualizaEmpleado", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodPer", SqlDbType.Int).Value = codpersona;
		objDA.SelectCommand.Parameters.Add("@codEmple", SqlDbType.Int).Value = codempleado;
		objDA.SelectCommand.Parameters.Add("@year", SqlDbType.Int).Value = year;
		objDA.SelectCommand.Parameters.Add("@idorganiz", SqlDbType.Int).Value = idorganiz;
		objDA.SelectCommand.Parameters.Add("@TipoDocIdent", SqlDbType.Int).Value = TipoDocIdent;
		objDA.SelectCommand.Parameters.Add("@NumDoc", SqlDbType.Char, 12).Value = NumDoc;
		objDA.SelectCommand.Parameters.Add("@Apellido_Paterno", SqlDbType.VarChar, 30).Value = Apellido_Paterno;
		objDA.SelectCommand.Parameters.Add("@Apellido_Materno", SqlDbType.VarChar, 30).Value = Apellido_Materno;
		objDA.SelectCommand.Parameters.Add("@Nombres", SqlDbType.VarChar, 100).Value = Nombres;
		objDA.SelectCommand.Parameters.Add("@ubigeoNac", SqlDbType.Char, 6).Value = ubigeoNac;
		objDA.SelectCommand.Parameters.Add("@fechaNac", SqlDbType.DateTime).Value = fechaNac;
		objDA.SelectCommand.Parameters.Add("@Direccion", SqlDbType.VarChar, 100).Value = Direccion;
		objDA.SelectCommand.Parameters.Add("@Fono", SqlDbType.VarChar, 15).Value = Fono;
		objDA.SelectCommand.Parameters.Add("@FonoLab", SqlDbType.VarChar, 15).Value = FonoLab;
		objDA.SelectCommand.Parameters.Add("@FonoCel", SqlDbType.VarChar, 15).Value = FonoCel;
		objDA.SelectCommand.Parameters.Add("@FonoOtro", SqlDbType.VarChar, 15).Value = FonoOtro;
		objDA.SelectCommand.Parameters.Add("@Mail", SqlDbType.VarChar, 50).Value = Mail;
		objDA.SelectCommand.Parameters.Add("@UbigeoDireccion", SqlDbType.Char, 6).Value = UbigeoDireccion;
		objDA.SelectCommand.Parameters.Add("@idNacionalidad", SqlDbType.Int).Value = idNacionalidad;
		objDA.SelectCommand.Parameters.Add("@sexo", SqlDbType.Char, 1).Value = sexo;
		objDA.SelectCommand.Parameters.Add("@idEstCivil", SqlDbType.Int).Value = idEstCivil;
		objDA.SelectCommand.Parameters.Add("@idDiscapacidad", SqlDbType.Int).Value = idDiscapacidad;
		objDA.SelectCommand.Parameters.Add("@expSocial", SqlDbType.VarChar, 20).Value = expSocial;
		objDA.SelectCommand.Parameters.Add("@FechaIngreso", SqlDbType.SmallDateTime).Value = FechaIngreso;
		objDA.SelectCommand.Parameters.Add("@idtiposangre", SqlDbType.Int).Value = tiposangre;
		objDA.SelectCommand.Parameters.Add("@brevete", SqlDbType.VarChar, 12).Value = brevete;
		objDA.SelectCommand.Parameters.Add("@libmilitar", SqlDbType.VarChar, 10).Value = libmilitar;
		objDA.SelectCommand.Parameters.Add("@gradoinstrucc", SqlDbType.VarChar, 80).Value = gradoinstruccion;
		objDA.SelectCommand.Parameters.Add("@numruc", SqlDbType.VarChar, 12).Value = numRuc;
		objDA.SelectCommand.Parameters.Add("@idtipoTrabajador", SqlDbType.Int).Value = idtipoTrabajador;
		objDA.SelectCommand.Parameters.Add("@Foto", SqlDbType.Image).Value = Foto;
		objDA.SelectCommand.ExecuteNonQuery();
		ObjCnn.Close();
	}

	public void Actualiza_Empleado(int codempleado)
	{
		ObjCnn.Open();
		objDA.SelectCommand = new SqlCommand("spRRHH_EliminarEmpleado", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@codEmple", SqlDbType.Int).Value = codempleado;
		objDA.SelectCommand.ExecuteNonQuery();
		ObjCnn.Close();
	}

	public object llena_tree()
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("select IdAreaOrganiz As Padre, AreaOrganizacional,IdDependeDe as Hijo from dbo.EstructOrganiz where Year=" + Conversions.ToString(mAnio), ObjCnn);
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public DataTable buscar_empleado_tree(int area, int tipotrab)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("sp_RRHH_Busca_Empleado_tree", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idAreaOrganiz", SqlDbType.Int).Value = area;
		objDA.SelectCommand.Parameters.Add("@year", SqlDbType.Int).Value = mAnio;
		objDA.SelectCommand.Parameters.Add("@estado", SqlDbType.Bit).Value = true;
		objDA.SelectCommand.Parameters.Add("@tipotrabajador", SqlDbType.Int).Value = tipotrab;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object Generar_Ficha(int codEmple)
	{
		ObjCnn.Open();
		DataSet dataSet = new DataSet();
		objDA.SelectCommand = new SqlCommand("spRRHH_fichaSocial", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@codEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataSet, "FichaSocial");
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_ExpLab", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@codEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataSet, "FichaSocialExp");
		ObjCnn.Close();
		return dataSet;
	}

	public object Generar_Ficha_Prueba(int codEmple)
	{
		ObjCnn.Open();
		DataSet dataSet = new DataSet();
		dataSet.Clear();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_ExpLab_Datos", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable);
		if (dataTable.Rows.Count >= 1)
		{
			dataTable.TableName = "spRRHH_Ficha_ExpLab_Datos";
			dataSet.Tables.Add(dataTable);
		}
		DataTable dataTable2 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_busca_Disciplina", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable2);
		if (dataTable2.Rows.Count >= 1)
		{
			dataTable2.TableName = "spRRHH_busca_Disciplina";
			dataSet.Tables.Add(dataTable2);
		}
		DataTable dataTable3 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_ExpLab", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable3);
		if (dataTable3.Rows.Count >= 1)
		{
			dataTable3.TableName = "spRRHH_Ficha_ExpLab";
			dataSet.Tables.Add(dataTable3);
		}
		DataTable dataTable4 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_Det_Familiar", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable4);
		if (dataTable4.Rows.Count >= 1)
		{
			dataTable4.TableName = "spRRHH_Ficha_Det_Familiar";
			dataSet.Tables.Add(dataTable4);
		}
		DataTable dataTable5 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_Estudio_Realizado", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable5);
		if (dataTable5.Rows.Count >= 1)
		{
			dataTable5.TableName = "spRRHH_Ficha_Estudio_Realizado";
			dataSet.Tables.Add(dataTable5);
		}
		DataTable dataTable6 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_Estudio_Titulo", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable6);
		if (dataTable6.Rows.Count >= 1)
		{
			dataTable6.TableName = "spRRHH_Ficha_Estudio_Titulo";
			dataSet.Tables.Add(dataTable6);
		}
		DataTable dataTable7 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_Estudio_Capacitacion", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable7);
		if (dataTable7.Rows.Count >= 1)
		{
			dataTable7.TableName = "spRRHH_Ficha_Estudio_Capacitacion";
			dataSet.Tables.Add(dataTable7);
		}
		DataTable dataTable8 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_Ingreso_Egreso", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable8);
		if (dataTable8.Rows.Count >= 1)
		{
			dataTable8.TableName = "spRRHH_Ficha_Ingreso_Egreso";
			dataSet.Tables.Add(dataTable8);
		}
		DataTable dataTable9 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_Vivienda", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable9);
		if (dataTable9.Rows.Count >= 1)
		{
			dataTable9.TableName = "spRRHH_Ficha_Vivienda";
			dataSet.Tables.Add(dataTable9);
		}
		DataTable dataTable10 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_DatosPersonales", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable10);
		if (dataTable10.Rows.Count >= 1)
		{
			dataTable10.TableName = "spRRHH_Ficha_DatosPersonales";
			dataSet.Tables.Add(dataTable10);
		}
		DataTable dataTable11 = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Ficha_Det_Familiar_Salud", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@CodEmple", SqlDbType.Int).Value = codEmple;
		objDA.Fill(dataTable11);
		if (dataTable10.Rows.Count >= 1)
		{
			dataTable11.TableName = "spRRHH_Ficha_Det_Familiar_Salud";
			dataSet.Tables.Add(dataTable11);
		}
		ObjCnn.Close();
		return dataSet;
	}

	public object Generar_Cuadro_Pers(int tipo)
	{
		ObjCnn.Open();
		DataSet dataSet = new DataSet();
		objDA.SelectCommand = new SqlCommand("spRRHH_Report_CuadroPer", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@Tipo", SqlDbType.Int).Value = tipo;
		objDA.Fill(dataSet, "Cuadro");
		ObjCnn.Close();
		return dataSet;
	}

	public object Generar_Cumples(int mes)
	{
		ObjCnn.Open();
		DataSet dataSet = new DataSet();
		objDA.SelectCommand = new SqlCommand("spRRHH_Report_Cumple", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@mes", SqlDbType.Int).Value = mes;
		objDA.Fill(dataSet, "spRRHH_Report_Cumple");
		ObjCnn.Close();
		return dataSet;
	}

	public object llena_tree_reporte()
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("Select AreaOrganizacional,siglafull,IdAreaOrganiz As Padre,IdDependeDe as Hijo from vEstructOrganiz where Year=" + Conversions.ToString(mAnio), ObjCnn);
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public object Generar_Report_oficina(int CodOficina)
	{
		ObjCnn.Open();
		DataSet dataSet = new DataSet();
		objDA.SelectCommand = new SqlCommand("spRRHH_Report_Oficina_Unico", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idarea", SqlDbType.Int).Value = CodOficina;
		objDA.Fill(dataSet, "spRRHH_Report_Oficina_Unico");
		ObjCnn.Close();
		return dataSet;
	}

	public object Generar_Report_oficina_Dep(string Sigla)
	{
		ObjCnn.Open();
		DataSet dataSet = new DataSet();
		objDA.SelectCommand = new SqlCommand("spRRHH_Report_Oficina", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@sigla", SqlDbType.VarChar).Value = Sigla;
		objDA.Fill(dataSet, "spRRHH_Report_Oficina");
		ObjCnn.Close();
		return dataSet;
	}

	public object Generar_Report_Emple_ficha(string FechaInicio, string Fechatermino, int tipo)
	{
		ObjCnn.Open();
		DataSet dataSet = new DataSet();
		objDA.SelectCommand = new SqlCommand("spRRHH_Report_FechaIngreso", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@FechaIni", SqlDbType.Char, 8).Value = FechaInicio;
		objDA.SelectCommand.Parameters.Add("@FechaFin", SqlDbType.Char, 8).Value = Fechatermino;
		objDA.SelectCommand.Parameters.Add("@tipo", SqlDbType.Int).Value = tipo;
		objDA.Fill(dataSet, "spRRHH_Report_FechaIngreso");
		int count = dataSet.Tables[0].Rows.Count;
		ObjCnn.Close();
		return dataSet;
	}

	public DataTable generar_rep_cargos(int idCargo)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Rep_cargos", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idCargo", SqlDbType.Int).Value = idCargo;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object llena_Asistencias(string fechaInicio, string fechaFin)
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_GetRepAsistencias", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@FechaInicio", SqlDbType.VarChar).Value = fechaInicio;
		objDA.SelectCommand.Parameters.Add("@FechaFin", SqlDbType.VarChar).Value = fechaFin;
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}

	public object llena_Permisos(int codempleado, int? permiso, int? motivo)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_llenarPermiso", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@IdEmpleado", SqlDbType.Int).Value = codempleado;
		objDA.SelectCommand.Parameters.Add("@idTipoPermiso", SqlDbType.Int).Value = permiso;
		objDA.SelectCommand.Parameters.Add("@idmotivo", SqlDbType.Int).Value = motivo;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object llena_HorariosTemporales(int codempleado)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("[spRRHH_llenarHorarioTemporal]", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@IdEmpleado", SqlDbType.Int).Value = codempleado;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object Generar_Rep_Faltas(string fecha, int? idTipoTrabajador, int? idAreaOrganiz, int? Año)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Faltas", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@fecha", SqlDbType.VarChar).Value = fecha;
		objDA.SelectCommand.Parameters.Add("@idTipoTrabajador", SqlDbType.Int).Value = idTipoTrabajador;
		objDA.SelectCommand.Parameters.Add("@idAreaOrganiz", SqlDbType.Int).Value = idAreaOrganiz;
		objDA.SelectCommand.Parameters.Add("@Anio", SqlDbType.Int).Value = Año;
		dataTable.TableName = "spRRHH_Faltas";
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object ObtenerAsistenciasxDia(string fecha)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_GetAsistencias", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@dia", SqlDbType.Char).Value = fecha;
		dataTable.TableName = "spRRHH_GetAsistencias";
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object ObtenerEmpleados()
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("select idempleado,NombresC from vs_GetEmpleado where Estado=1", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.Text;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object LlenarPlanillaAsistencia(string fechas, string idTipoTrabajador, string idLocales)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_RepPlanillaAsistencias", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@Fechas", SqlDbType.NVarChar).Value = fechas;
		objDA.SelectCommand.Parameters.Add("@idTipoTrabajador", SqlDbType.Char).Value = idTipoTrabajador;
		objDA.SelectCommand.Parameters.Add("@idLocales", SqlDbType.NVarChar).Value = idLocales;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable GetFeriado(string fecha)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("select * from RRHH_Feriado where convert(char(10),Fecha,103)='" + fecha + "'", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.Text;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_RepPermisos(string fechaI, string fechaF, int? tipopermiso, int? motivo, int? idTipoTrabajador)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_RepPermisos", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@FechaInicio", SqlDbType.NVarChar).Value = fechaI;
		objDA.SelectCommand.Parameters.Add("@FechaFin", SqlDbType.NVarChar).Value = fechaF;
		objDA.SelectCommand.Parameters.Add("@idTipoPermiso", SqlDbType.Int).Value = tipopermiso;
		objDA.SelectCommand.Parameters.Add("@idmotivo", SqlDbType.Int).Value = motivo;
		objDA.SelectCommand.Parameters.Add("@idtipoEmpleado", SqlDbType.Int).Value = idTipoTrabajador;
		dataTable.TableName = "spRRHH_RepPermisos";
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object spRRHH_ObtenerHorasExtras(string fechaI, string fechaF, int? tipo)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_ObtenerHorasExtras", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@FechaI", SqlDbType.NVarChar).Value = fechaI;
		objDA.SelectCommand.Parameters.Add("@FechaF", SqlDbType.NVarChar).Value = fechaF;
		objDA.SelectCommand.Parameters.Add("@tipo", SqlDbType.Int).Value = tipo;
		dataTable.TableName = "spRRHH_ObtenerHorasExtras";
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object BuscarPersonas(string ApellidoPaterno)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("select P.IdPersona,Apellido_Paterno, P.Apellido_Materno, P.Nombres from dbo.Persona P Where P.Apellido_Paterno like '" + ApellidoPaterno + "%' and TipoPersona = 'N'", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.Text;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public object ListarProfesiones()
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("sp_RRHH_ListarProfesiones", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_Rep_profesion(string profesion)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_Rep_profesion", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@profesion", SqlDbType.NVarChar).Value = profesion;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_ListarTrabajadores(int idTipoTrabajador)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_ListarTrabajadores", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@IdTipoTrabajador", SqlDbType.Int).Value = idTipoTrabajador;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_ListarTrabajadoresRep(int idTipoTrabajador)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_ListarTrabajadoresRep", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@IdTipoTrabajador", SqlDbType.Int).Value = idTipoTrabajador;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_AgregarReporte(int idTipoTrabajador, int opcion)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_AgregarReporte", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idEmpleado", SqlDbType.Int).Value = idTipoTrabajador;
		objDA.SelectCommand.Parameters.Add("@opt", SqlDbType.Int).Value = opcion;
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_RepAsisdiarria(string fechaI, string fechaF, string DNI, int? area, int? tipo, string year, string idLocales, int opt = 0)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spGetAsistenciasDetalle", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@FechaIni", SqlDbType.NVarChar).Value = fechaI;
		objDA.SelectCommand.Parameters.Add("@FechaFin", SqlDbType.NVarChar).Value = fechaF;
		objDA.SelectCommand.Parameters.Add("@DNI", SqlDbType.NVarChar).Value = DNI;
		objDA.SelectCommand.Parameters.Add("@opt", SqlDbType.Int).Value = opt;
		objDA.SelectCommand.Parameters.Add("@TipoEmpleado", SqlDbType.Int).Value = tipo;
		objDA.SelectCommand.Parameters.Add("@idLocales", SqlDbType.NVarChar).Value = idLocales;
		objDA.SelectCommand.Parameters.Add("@Area", SqlDbType.Int).Value = area;
		dataTable.TableName = "spGetAsistenciasDetalle";
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_ListarMotivos_byTipo(string fechaI)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_ListarMotivos_byTipo", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@TipoModalidad", SqlDbType.NVarChar).Value = fechaI;
		dataTable.TableName = "spRRHH_ListarMotivos_byTipo";
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_EstadisticaPermiso(string IdTipoTrabajador, string FechaInicio, string FechaFin, string idMotivos, string Motivos, string MotivosNull, string idAreas)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_EstadisticaPermiso", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@IdTipoTrabajador", SqlDbType.Int).Value = IdTipoTrabajador;
		objDA.SelectCommand.Parameters.Add("@FechaInicio", SqlDbType.NVarChar).Value = FechaInicio;
		objDA.SelectCommand.Parameters.Add("@FechaFin", SqlDbType.NVarChar).Value = FechaFin;
		objDA.SelectCommand.Parameters.Add("@idMotivos", SqlDbType.NVarChar).Value = idMotivos;
		objDA.SelectCommand.Parameters.Add("@Motivos", SqlDbType.NVarChar).Value = Motivos;
		objDA.SelectCommand.Parameters.Add("@MotivosNull", SqlDbType.NVarChar).Value = MotivosNull;
		objDA.SelectCommand.Parameters.Add("@idAreas", SqlDbType.NVarChar).Value = idAreas;
		dataTable.TableName = "spRRHH_EstadisticaPermiso";
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_ResumenEstadisticaPermiso(string FechaInicio, string FechaFin, int idMotivo, int idArea)
	{
		if (ObjCnn.State == ConnectionState.Closed)
		{
			ObjCnn.Open();
		}
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_ResumenEstadisticaPermiso", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@idAreaOrganiz", SqlDbType.Int).Value = idArea;
		objDA.SelectCommand.Parameters.Add("@idMotivo", SqlDbType.NVarChar).Value = idMotivo;
		objDA.SelectCommand.Parameters.Add("@FechaInicio", SqlDbType.NVarChar).Value = FechaInicio;
		objDA.SelectCommand.Parameters.Add("@FechaFin", SqlDbType.NVarChar).Value = FechaFin;
		dataTable.TableName = "spRRHH_ResumenEstadisticaPermiso";
		objDA.Fill(dataTable);
		if (ObjCnn.State == ConnectionState.Open)
		{
			ObjCnn.Close();
		}
		return dataTable;
	}

	public DataTable spRRHH_GetAsistenciaDia(int codigo, string fecha)
	{
		ObjCnn.Open();
		DataTable dataTable = new DataTable();
		objDA.SelectCommand = new SqlCommand("spRRHH_GetAsistenciaDia", ObjCnn);
		objDA.SelectCommand.CommandType = CommandType.StoredProcedure;
		objDA.SelectCommand.Parameters.Add("@IdEmpleado", SqlDbType.Int).Value = codigo;
		objDA.SelectCommand.Parameters.Add("@Fecha", SqlDbType.VarChar).Value = fecha;
		objDA.Fill(dataTable);
		ObjCnn.Close();
		return dataTable;
	}
}
