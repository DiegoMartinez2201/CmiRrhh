using System;
using System.ComponentModel;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.CompilerServices;
using System.Windows.Forms;
using Custom_Featured_MessageBox;
using Microsoft.VisualBasic.CompilerServices;

namespace GRLL.Common;

[DesignerGenerated]
public class ucLogin : UserControl
{
	public delegate void onAceptarEventHandler();

	public delegate void onSalirEventHandler();

	public delegate void onSalirIntentosEventHandler();

	public delegate void onConfigurationChangedEventHandler();

	private IContainer components;

	[AccessedThroughProperty("Label2")]
	private Label _Label2;

	[AccessedThroughProperty("Label1")]
	private Label _Label1;

	[AccessedThroughProperty("Label3")]
	private Label _Label3;

	[AccessedThroughProperty("txtclave")]
	private TextBox _txtclave;

	[AccessedThroughProperty("txtusuario")]
	private TextBox _txtusuario;

	[AccessedThroughProperty("btnAceptar")]
	private Button _btnAceptar;

	[AccessedThroughProperty("btnCancelar")]
	private Button _btnCancelar;

	private Font _fuente;

	private Color _color;

	private Size _tamaño;

	[SpecialName]
	private int $STATIC$btnAceptar_Click$20211C127D$C;

	internal virtual Label Label2
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label2;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label2 = value;
		}
	}

	internal virtual Label Label1
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label1;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label1 = value;
		}
	}

	internal virtual Label Label3
	{
		[DebuggerNonUserCode]
		get
		{
			return _Label3;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			_Label3 = value;
		}
	}

	internal virtual TextBox txtclave
	{
		[DebuggerNonUserCode]
		get
		{
			return _txtclave;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			EventHandler value2 = txtclave_TextChanged;
			KeyPressEventHandler value3 = txtclave_KeyPress;
			if (_txtclave != null)
			{
				_txtclave.TextChanged -= value2;
				_txtclave.KeyPress -= value3;
			}
			_txtclave = value;
			if (_txtclave != null)
			{
				_txtclave.TextChanged += value2;
				_txtclave.KeyPress += value3;
			}
		}
	}

	internal virtual TextBox txtusuario
	{
		[DebuggerNonUserCode]
		get
		{
			return _txtusuario;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			KeyPressEventHandler value2 = txtusuario_KeyPress;
			if (_txtusuario != null)
			{
				_txtusuario.KeyPress -= value2;
			}
			_txtusuario = value;
			if (_txtusuario != null)
			{
				_txtusuario.KeyPress += value2;
			}
		}
	}

	internal virtual Button btnAceptar
	{
		[DebuggerNonUserCode]
		get
		{
			return _btnAceptar;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			MouseEventHandler value2 = btnAceptar_MouseDown;
			MouseEventHandler value3 = btnAceptar_MouseUp;
			EventHandler value4 = btnAceptar_Click;
			if (_btnAceptar != null)
			{
				_btnAceptar.MouseDown -= value2;
				_btnAceptar.MouseUp -= value3;
				_btnAceptar.Click -= value4;
			}
			_btnAceptar = value;
			if (_btnAceptar != null)
			{
				_btnAceptar.MouseDown += value2;
				_btnAceptar.MouseUp += value3;
				_btnAceptar.Click += value4;
			}
		}
	}

	internal virtual Button btnCancelar
	{
		[DebuggerNonUserCode]
		get
		{
			return _btnCancelar;
		}
		[MethodImpl(MethodImplOptions.Synchronized)]
		[DebuggerNonUserCode]
		set
		{
			MouseEventHandler value2 = btnCancelar_MouseUp;
			MouseEventHandler value3 = btnCancelar_MouseDown;
			EventHandler value4 = btnCancelar_Click;
			if (_btnCancelar != null)
			{
				_btnCancelar.MouseUp -= value2;
				_btnCancelar.MouseDown -= value3;
				_btnCancelar.Click -= value4;
			}
			_btnCancelar = value;
			if (_btnCancelar != null)
			{
				_btnCancelar.MouseUp += value2;
				_btnCancelar.MouseDown += value3;
				_btnCancelar.Click += value4;
			}
		}
	}

	public SQLConfiguracion Configuracion
	{
		get
		{
			return clsConexion.Configuracion;
		}
		set
		{
			clsConexion.Configuracion = value;
		}
	}

	public Font MsgFuente
	{
		get
		{
			return _fuente;
		}
		set
		{
			_fuente = value;
		}
	}

	public Color MsgColor
	{
		get
		{
			return _color;
		}
		set
		{
			_color = value;
		}
	}

	public Size MsgTamaño
	{
		get
		{
			return _tamaño;
		}
		set
		{
			_tamaño = value;
		}
	}

	[method: DebuggerNonUserCode]
	public event onAceptarEventHandler onAceptar;

	[method: DebuggerNonUserCode]
	public event onSalirEventHandler onSalir;

	[method: DebuggerNonUserCode]
	public event onSalirIntentosEventHandler onSalirIntentos;

	[method: DebuggerNonUserCode]
	public event onConfigurationChangedEventHandler onConfigurationChanged;

	[DebuggerNonUserCode]
	protected override void Dispose(bool disposing)
	{
		try
		{
			if (disposing && components != null)
			{
				components.Dispose();
			}
		}
		finally
		{
			base.Dispose(disposing);
		}
	}

	[System.Diagnostics.DebuggerStepThrough]
	private void InitializeComponent()
	{
		System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(GRLL.Common.ucLogin));
		this.Label2 = new System.Windows.Forms.Label();
		this.Label1 = new System.Windows.Forms.Label();
		this.Label3 = new System.Windows.Forms.Label();
		this.txtclave = new System.Windows.Forms.TextBox();
		this.txtusuario = new System.Windows.Forms.TextBox();
		this.btnAceptar = new System.Windows.Forms.Button();
		this.btnCancelar = new System.Windows.Forms.Button();
		this.SuspendLayout();
		this.Label2.AutoSize = true;
		System.Windows.Forms.Label label = this.Label2;
		System.Drawing.Point location = new System.Drawing.Point(80, 58);
		label.Location = location;
		this.Label2.Name = "Label2";
		System.Windows.Forms.Label label2 = this.Label2;
		System.Drawing.Size size = new System.Drawing.Size(61, 13);
		label2.Size = size;
		this.Label2.TabIndex = 9;
		this.Label2.Text = "Contraseña";
		this.Label1.AutoSize = true;
		System.Windows.Forms.Label label3 = this.Label1;
		location = new System.Drawing.Point(98, 30);
		label3.Location = location;
		this.Label1.Name = "Label1";
		System.Windows.Forms.Label label4 = this.Label1;
		size = new System.Drawing.Size(43, 13);
		label4.Size = size;
		this.Label1.TabIndex = 8;
		this.Label1.Text = "Usuario";
		this.Label3.Image = (System.Drawing.Image)resources.GetObject("Label3.Image");
		System.Windows.Forms.Label label5 = this.Label3;
		location = new System.Drawing.Point(3, 7);
		label5.Location = location;
		this.Label3.Name = "Label3";
		System.Windows.Forms.Label label6 = this.Label3;
		size = new System.Drawing.Size(77, 135);
		label6.Size = size;
		this.Label3.TabIndex = 12;
		this.txtclave.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
		System.Windows.Forms.TextBox textBox = this.txtclave;
		location = new System.Drawing.Point(145, 54);
		textBox.Location = location;
		this.txtclave.Name = "txtclave";
		this.txtclave.PasswordChar = '*';
		System.Windows.Forms.TextBox textBox2 = this.txtclave;
		size = new System.Drawing.Size(147, 20);
		textBox2.Size = size;
		this.txtclave.TabIndex = 1;
		this.txtusuario.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
		System.Windows.Forms.TextBox textBox3 = this.txtusuario;
		location = new System.Drawing.Point(145, 26);
		textBox3.Location = location;
		this.txtusuario.Name = "txtusuario";
		System.Windows.Forms.TextBox textBox4 = this.txtusuario;
		size = new System.Drawing.Size(147, 20);
		textBox4.Size = size;
		this.txtusuario.TabIndex = 0;
		this.btnAceptar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
		this.btnAceptar.Cursor = System.Windows.Forms.Cursors.Hand;
		this.btnAceptar.FlatAppearance.BorderColor = System.Drawing.Color.White;
		this.btnAceptar.FlatAppearance.BorderSize = 0;
		this.btnAceptar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
		this.btnAceptar.Font = new System.Drawing.Font("Tahoma", 8.25f, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0);
		this.btnAceptar.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
		this.btnAceptar.Image = (System.Drawing.Image)resources.GetObject("btnAceptar.Image");
		System.Windows.Forms.Button button = this.btnAceptar;
		location = new System.Drawing.Point(84, 98);
		button.Location = location;
		this.btnAceptar.Name = "btnAceptar";
		System.Windows.Forms.Button button2 = this.btnAceptar;
		size = new System.Drawing.Size(73, 36);
		button2.Size = size;
		this.btnAceptar.TabIndex = 2;
		this.btnAceptar.Text = "Aceptar";
		this.btnAceptar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
		this.btnAceptar.UseVisualStyleBackColor = true;
		this.btnCancelar.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
		this.btnCancelar.Cursor = System.Windows.Forms.Cursors.Hand;
		this.btnCancelar.FlatAppearance.BorderColor = System.Drawing.Color.White;
		this.btnCancelar.FlatAppearance.BorderSize = 0;
		this.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
		this.btnCancelar.Font = new System.Drawing.Font("Tahoma", 8.25f, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0);
		this.btnCancelar.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
		this.btnCancelar.Image = (System.Drawing.Image)resources.GetObject("btnCancelar.Image");
		System.Windows.Forms.Button button3 = this.btnCancelar;
		location = new System.Drawing.Point(163, 98);
		button3.Location = location;
		this.btnCancelar.Name = "btnCancelar";
		System.Windows.Forms.Button button4 = this.btnCancelar;
		size = new System.Drawing.Size(73, 36);
		button4.Size = size;
		this.btnCancelar.TabIndex = 3;
		this.btnCancelar.Text = "Cancelar";
		this.btnCancelar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
		this.btnCancelar.UseVisualStyleBackColor = true;
		System.Drawing.SizeF sizeF = new System.Drawing.SizeF(6f, 13f);
		this.AutoScaleDimensions = sizeF;
		this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
		this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
		this.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
		this.Controls.Add(this.btnCancelar);
		this.Controls.Add(this.btnAceptar);
		this.Controls.Add(this.Label2);
		this.Controls.Add(this.Label1);
		this.Controls.Add(this.txtusuario);
		this.Controls.Add(this.txtclave);
		this.Controls.Add(this.Label3);
		this.Name = "ucLogin";
		size = new System.Drawing.Size(299, 147);
		this.Size = size;
		this.ResumeLayout(false);
		this.PerformLayout();
	}

	public ucLogin()
	{
		base.Load += ucLogin_Load;
		InitializeComponent();
		clsConexion.ConfigurationChanged += cambioconfig;
	}

	private void cambioconfig()
	{
		txtusuario.Text = Configuracion.Usuario;
	}

	public object Color(Color Color_Form)
	{
		BackColor = Color_Form;
		btnAceptar.BackColor = System.Drawing.Color.Transparent;
		btnCancelar.BackColor = System.Drawing.Color.Transparent;
		object Color = default(object);
		return Color;
	}

	private void btnAceptar_Click(object sender, EventArgs e)
	{
		SQLConfiguracion configuracion = Configuracion;
		configuracion.Usuario = txtusuario.Text.Trim();
		configuracion.Password = txtclave.Text.Trim();
		configuracion = null;
		checked
		{
			try
			{
				SqlConnection Conexion = clsConexion.SQL_AbrirConexion();
				if (Conexion != null)
				{
					clsConexion.SQL_CerrarConexion();
					btnAceptar_MouseUp(null, null);
					onAceptar?.Invoke();
				}
			}
			catch (Exception ex)
			{
				ProjectData.SetProjectError(ex);
				Exception ex2 = ex;
				XMessageBox.show("ERROR DE CONEXION: \r\n" + ex2.Message, "", MsgColor, System.Drawing.Color.Black, XMessageBoxButtons.OK, XMessageBoxIcon.Warning, MsgTamaño, MsgFuente);
				txtusuario.Focus();
				$STATIC$btnAceptar_Click$20211C127D$C++;
				if ($STATIC$btnAceptar_Click$20211C127D$C == 3)
				{
					$STATIC$btnAceptar_Click$20211C127D$C = 0;
					onSalirIntentos?.Invoke();
				}
				ProjectData.ClearProjectError();
			}
		}
	}

	private void txtclave_KeyPress(object sender, KeyPressEventArgs e)
	{
		if (e.KeyChar == '\r')
		{
			btnAceptar_Click(null, null);
		}
	}

	private void txtclave_TextChanged(object sender, EventArgs e)
	{
	}

	private void btnCancelar_Click(object sender, EventArgs e)
	{
		onSalir?.Invoke();
	}

	private void txtusuario_KeyPress(object sender, KeyPressEventArgs e)
	{
		if (e.KeyChar == '\r')
		{
			txtclave.Focus();
		}
	}

	private void btnAceptar_MouseDown(object sender, MouseEventArgs e)
	{
		btnAceptar.Font = new Font("Tahoma", 7.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
	}

	private void btnAceptar_MouseUp(object sender, MouseEventArgs e)
	{
		btnAceptar.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
	}

	private void btnCancelar_MouseDown(object sender, MouseEventArgs e)
	{
		btnCancelar.Font = new Font("Tahoma", 7.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
	}

	private void btnCancelar_MouseUp(object sender, MouseEventArgs e)
	{
		btnCancelar.Font = new Font("Tahoma", 8.25f, FontStyle.Bold, GraphicsUnit.Point, 0);
	}

	private void ucLogin_Load(object sender, EventArgs e)
	{
	}
}
