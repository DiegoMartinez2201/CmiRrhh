using System;
using System.CodeDom.Compiler;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.Configuration;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Security.Cryptography;
using System.Text;
using System.Xml.Linq;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.ApplicationServices;
using Microsoft.VisualBasic.CompilerServices;
using Microsoft.VisualBasic.Devices;
using Microsoft.VisualBasic.MyServices.Internal;

[assembly: AssemblyDescription("")]
[assembly: AssemblyCopyright("Copyright © Microsoft 2010")]
[assembly: AssemblyTitle("Seguridad")]
[assembly: ComVisible(false)]
[assembly: AssemblyProduct("Seguridad")]
[assembly: AssemblyCompany("Microsoft")]
[assembly: AssemblyTrademark("")]
[assembly: Debuggable(DebuggableAttribute.DebuggingModes.Default | DebuggableAttribute.DebuggingModes.DisableOptimizations | DebuggableAttribute.DebuggingModes.IgnoreSymbolStoreSequencePoints | DebuggableAttribute.DebuggingModes.EnableEditAndContinue)]
[assembly: CompilationRelaxations(8)]
[assembly: RuntimeCompatibility(WrapNonExceptionThrows = true)]
[assembly: AssemblyFileVersion("1.0.0.0")]
[assembly: Guid("1a7ab06b-6a4e-41e7-a42e-0c16f9f7d785")]
[assembly: AssemblyVersion("1.0.0.0")]
namespace Seguridad.My
{
	[GeneratedCode("MyTemplate", "8.0.0.0")]
	[EditorBrowsable(EditorBrowsableState.Never)]
	internal class MyApplication : ApplicationBase
	{
		[DebuggerNonUserCode]
		public MyApplication()
		{
		}
	}
	[GeneratedCode("MyTemplate", "8.0.0.0")]
	[EditorBrowsable(EditorBrowsableState.Never)]
	internal class MyComputer : Computer
	{
		[EditorBrowsable(EditorBrowsableState.Never)]
		[DebuggerHidden]
		public MyComputer()
		{
		}
	}
	[StandardModule]
	[HideModuleName]
	[GeneratedCode("MyTemplate", "8.0.0.0")]
	internal sealed class MyProject
	{
		[MyGroupCollection("System.Web.Services.Protocols.SoapHttpClientProtocol", "Create__Instance__", "Dispose__Instance__", "")]
		[EditorBrowsable(EditorBrowsableState.Never)]
		internal sealed class MyWebServices
		{
			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			public override bool Equals(object o)
			{
				return base.Equals(RuntimeHelpers.GetObjectValue(o));
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			public override int GetHashCode()
			{
				return base.GetHashCode();
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			[DebuggerHidden]
			internal new Type GetType()
			{
				return typeof(MyWebServices);
			}

			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public override string ToString()
			{
				return base.ToString();
			}

			[DebuggerHidden]
			private static T Create__Instance__<T>(T instance) where T : new()
			{
				if (instance == null)
				{
					return new T();
				}
				return instance;
			}

			[DebuggerHidden]
			private void Dispose__Instance__<T>(ref T instance)
			{
				instance = default(T);
			}

			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public MyWebServices()
			{
			}
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		[ComVisible(false)]
		internal sealed class ThreadSafeObjectProvider<T> where T : new()
		{
			private readonly ContextValue<T> m_Context;

			internal T GetInstance
			{
				[DebuggerHidden]
				get
				{
					T val = m_Context.Value;
					if (val == null)
					{
						val = new T();
						m_Context.Value = val;
					}
					return val;
				}
			}

			[DebuggerHidden]
			[EditorBrowsable(EditorBrowsableState.Never)]
			public ThreadSafeObjectProvider()
			{
				m_Context = new ContextValue<T>();
			}
		}

		private static readonly ThreadSafeObjectProvider<MyComputer> m_ComputerObjectProvider = new ThreadSafeObjectProvider<MyComputer>();

		private static readonly ThreadSafeObjectProvider<MyApplication> m_AppObjectProvider = new ThreadSafeObjectProvider<MyApplication>();

		private static readonly ThreadSafeObjectProvider<User> m_UserObjectProvider = new ThreadSafeObjectProvider<User>();

		private static readonly ThreadSafeObjectProvider<MyWebServices> m_MyWebServicesObjectProvider = new ThreadSafeObjectProvider<MyWebServices>();

		[HelpKeyword("My.Computer")]
		internal static MyComputer Computer
		{
			[DebuggerHidden]
			get
			{
				return m_ComputerObjectProvider.GetInstance;
			}
		}

		[HelpKeyword("My.Application")]
		internal static MyApplication Application
		{
			[DebuggerHidden]
			get
			{
				return m_AppObjectProvider.GetInstance;
			}
		}

		[HelpKeyword("My.User")]
		internal static User User
		{
			[DebuggerHidden]
			get
			{
				return m_UserObjectProvider.GetInstance;
			}
		}

		[HelpKeyword("My.WebServices")]
		internal static MyWebServices WebServices
		{
			[DebuggerHidden]
			get
			{
				return m_MyWebServicesObjectProvider.GetInstance;
			}
		}
	}
	[EditorBrowsable(EditorBrowsableState.Never)]
	[CompilerGenerated]
	[DebuggerNonUserCode]
	internal sealed class InternalXmlHelper
	{
		[CompilerGenerated]
		[DebuggerNonUserCode]
		[EditorBrowsable(EditorBrowsableState.Never)]
		private sealed class RemoveNamespaceAttributesClosure
		{
			private readonly string[] m_inScopePrefixes;

			private readonly XNamespace[] m_inScopeNs;

			private readonly List<XAttribute> m_attributes;

			[EditorBrowsable(EditorBrowsableState.Never)]
			internal RemoveNamespaceAttributesClosure(string[] inScopePrefixes, XNamespace[] inScopeNs, List<XAttribute> attributes)
			{
				m_inScopePrefixes = inScopePrefixes;
				m_inScopeNs = inScopeNs;
				m_attributes = attributes;
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			internal XElement ProcessXElement(XElement elem)
			{
				return RemoveNamespaceAttributes(m_inScopePrefixes, m_inScopeNs, m_attributes, elem);
			}

			[EditorBrowsable(EditorBrowsableState.Never)]
			internal object ProcessObject(object obj)
			{
				if (obj is XElement e)
				{
					return RemoveNamespaceAttributes(m_inScopePrefixes, m_inScopeNs, m_attributes, e);
				}
				return obj;
			}
		}

		// C# has no syntax for parameterized property 'Value'.
		public static string get_Value(IEnumerable<XElement> source)
		{
			using (IEnumerator<XElement> enumerator = source.GetEnumerator())
			{
				if (enumerator.MoveNext())
				{
					XElement current = enumerator.Current;
					return current.Value;
				}
			}
			return null;
		}

		public static void set_Value(IEnumerable<XElement> source, string value)
		{
			using IEnumerator<XElement> enumerator = source.GetEnumerator();
			if (enumerator.MoveNext())
			{
				XElement current = enumerator.Current;
				current.Value = value;
			}
		}

		// C# has no syntax for parameterized property 'AttributeValue'.
		public static string get_AttributeValue(IEnumerable<XElement> source, XName name)
		{
			using (IEnumerator<XElement> enumerator = source.GetEnumerator())
			{
				if (enumerator.MoveNext())
				{
					XElement current = enumerator.Current;
					return (string)current.Attribute(name);
				}
			}
			return null;
		}

		public static void set_AttributeValue(IEnumerable<XElement> source, XName name, string value)
		{
			using IEnumerator<XElement> enumerator = source.GetEnumerator();
			if (enumerator.MoveNext())
			{
				XElement current = enumerator.Current;
				current.SetAttributeValue(name, value);
			}
		}

		// C# has no syntax for parameterized property 'AttributeValue'.
		public static string get_AttributeValue(XElement source, XName name)
		{
			return (string)source.Attribute(name);
		}

		public static void set_AttributeValue(XElement source, XName name, string value)
		{
			source.SetAttributeValue(name, value);
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		private InternalXmlHelper()
		{
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		public static XAttribute CreateAttribute(XName name, object value)
		{
			if (value == null)
			{
				return null;
			}
			return new XAttribute(name, RuntimeHelpers.GetObjectValue(value));
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		public static XAttribute CreateNamespaceAttribute(XName name, XNamespace ns)
		{
			XAttribute xAttribute = new XAttribute(name, ns.NamespaceName);
			xAttribute.AddAnnotation(ns);
			return xAttribute;
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		public static object RemoveNamespaceAttributes(string[] inScopePrefixes, XNamespace[] inScopeNs, List<XAttribute> attributes, object obj)
		{
			if (obj != null)
			{
				if (obj is XElement e)
				{
					return RemoveNamespaceAttributes(inScopePrefixes, inScopeNs, attributes, e);
				}
				if (obj is IEnumerable obj2)
				{
					return RemoveNamespaceAttributes(inScopePrefixes, inScopeNs, attributes, obj2);
				}
			}
			return obj;
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		public static IEnumerable RemoveNamespaceAttributes(string[] inScopePrefixes, XNamespace[] inScopeNs, List<XAttribute> attributes, IEnumerable obj)
		{
			if (obj != null)
			{
				if (obj is IEnumerable<XElement> source)
				{
					return source.Select(new RemoveNamespaceAttributesClosure(inScopePrefixes, inScopeNs, attributes).ProcessXElement);
				}
				return obj.Cast<object>().Select(new RemoveNamespaceAttributesClosure(inScopePrefixes, inScopeNs, attributes).ProcessObject);
			}
			return obj;
		}

		[EditorBrowsable(EditorBrowsableState.Never)]
		public static XElement RemoveNamespaceAttributes(string[] inScopePrefixes, XNamespace[] inScopeNs, List<XAttribute> attributes, XElement e)
		{
			checked
			{
				if (e != null)
				{
					XAttribute xAttribute = e.FirstAttribute;
					while (xAttribute != null)
					{
						XAttribute nextAttribute = xAttribute.NextAttribute;
						if (xAttribute.IsNamespaceDeclaration)
						{
							XNamespace xNamespace = xAttribute.Annotation<XNamespace>();
							string localName = xAttribute.Name.LocalName;
							if ((object)xNamespace != null)
							{
								if ((inScopePrefixes != null && inScopeNs != null) ? true : false)
								{
									int num = inScopePrefixes.Length - 1;
									int num2 = num;
									int num3 = 0;
									while (true)
									{
										int num4 = num3;
										int num5 = num2;
										if (num4 > num5)
										{
											break;
										}
										string value = inScopePrefixes[num3];
										XNamespace xNamespace2 = inScopeNs[num3];
										if (localName.Equals(value))
										{
											if (xNamespace == xNamespace2)
											{
												xAttribute.Remove();
											}
											xAttribute = null;
											break;
										}
										num3++;
									}
								}
								if (xAttribute != null)
								{
									if (attributes != null)
									{
										int num6 = attributes.Count - 1;
										int num7 = num6;
										int num8 = 0;
										while (true)
										{
											int num9 = num8;
											int num5 = num7;
											if (num9 > num5)
											{
												break;
											}
											XAttribute xAttribute2 = attributes[num8];
											string localName2 = xAttribute2.Name.LocalName;
											XNamespace xNamespace3 = xAttribute2.Annotation<XNamespace>();
											if ((object)xNamespace3 != null && localName.Equals(localName2))
											{
												if (xNamespace == xNamespace3)
												{
													xAttribute.Remove();
												}
												xAttribute = null;
												break;
											}
											num8++;
										}
									}
									if (xAttribute != null)
									{
										xAttribute.Remove();
										attributes.Add(xAttribute);
									}
								}
							}
						}
						xAttribute = nextAttribute;
					}
				}
				return e;
			}
		}
	}
}
namespace Seguridad.My.Resources
{
	[CompilerGenerated]
	[GeneratedCode("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0")]
	[StandardModule]
	[DebuggerNonUserCode]
	[HideModuleName]
	internal sealed class Resources
	{
		private static ResourceManager resourceMan;

		private static CultureInfo resourceCulture;

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static ResourceManager ResourceManager
		{
			get
			{
				if (object.ReferenceEquals(resourceMan, null))
				{
					ResourceManager resourceManager = new ResourceManager("Seguridad.Resources", typeof(Resources).Assembly);
					resourceMan = resourceManager;
				}
				return resourceMan;
			}
		}

		[EditorBrowsable(EditorBrowsableState.Advanced)]
		internal static CultureInfo Culture
		{
			get
			{
				return resourceCulture;
			}
			set
			{
				resourceCulture = value;
			}
		}
	}
}
namespace Seguridad.My
{
	[EditorBrowsable(EditorBrowsableState.Advanced)]
	[GeneratedCode("Microsoft.VisualStudio.Editors.SettingsDesigner.SettingsSingleFileGenerator", "9.0.0.0")]
	[CompilerGenerated]
	internal sealed class MySettings : ApplicationSettingsBase
	{
		private static MySettings defaultInstance = (MySettings)SettingsBase.Synchronized(new MySettings());

		public static MySettings Default => defaultInstance;

		[DebuggerNonUserCode]
		public MySettings()
		{
		}
	}
	[StandardModule]
	[CompilerGenerated]
	[DebuggerNonUserCode]
	[HideModuleName]
	internal sealed class MySettingsProperty
	{
		[HelpKeyword("My.Settings")]
		internal static MySettings Settings => MySettings.Default;
	}
}
namespace Seguridad
{
	public class Seguridad
	{
		[DebuggerNonUserCode]
		public Seguridad()
		{
		}

		public static string EncryptString(string InputString, string SecretKey, CipherMode CyphMode = CipherMode.ECB)
		{
			TripleDESCryptoServiceProvider tripleDESCryptoServiceProvider = new TripleDESCryptoServiceProvider();
			byte[] bytes = Encoding.UTF8.GetBytes(InputString);
			MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
			tripleDESCryptoServiceProvider.Key = mD5CryptoServiceProvider.ComputeHash(Encoding.ASCII.GetBytes(SecretKey));
			tripleDESCryptoServiceProvider.Mode = CyphMode;
			MemoryStream memoryStream = new MemoryStream();
			CryptoStream cryptoStream = new CryptoStream(memoryStream, tripleDESCryptoServiceProvider.CreateEncryptor(), CryptoStreamMode.Write);
			cryptoStream.Write(bytes, 0, bytes.Length);
			cryptoStream.FlushFinalBlock();
			StringBuilder stringBuilder = new StringBuilder();
			byte[] array = memoryStream.ToArray();
			memoryStream.Close();
			int num = Information.UBound(array);
			int num2 = 0;
			while (true)
			{
				int num3 = num2;
				int num4 = num;
				if (num3 > num4)
				{
					break;
				}
				stringBuilder.AppendFormat("{0:X2}", array[num2]);
				num2 = checked(num2 + 1);
			}
			return stringBuilder.ToString();
		}

		public static string DecryptString(string InputString, string SecretKey, CipherMode CyphMode = CipherMode.ECB)
		{
			if (Operators.CompareString(InputString, string.Empty, TextCompare: false) == 0)
			{
				return "";
			}
			TripleDESCryptoServiceProvider tripleDESCryptoServiceProvider = new TripleDESCryptoServiceProvider();
			checked
			{
				byte[] array = new byte[(int)Math.Round((double)InputString.Length / 2.0 - 1.0) + 1];
				MD5CryptoServiceProvider mD5CryptoServiceProvider = new MD5CryptoServiceProvider();
				tripleDESCryptoServiceProvider.Key = mD5CryptoServiceProvider.ComputeHash(Encoding.ASCII.GetBytes(SecretKey));
				tripleDESCryptoServiceProvider.Mode = CyphMode;
				int num = array.Length - 1;
				int num2 = 0;
				while (true)
				{
					int num3 = num2;
					int num4 = num;
					if (num3 > num4)
					{
						break;
					}
					int num5 = Convert.ToInt32(InputString.Substring(num2 * 2, 2), 16);
					ByteConverter byteConverter = new ByteConverter();
					array[num2] = default(byte);
					array[num2] = Conversions.ToByte(byteConverter.ConvertTo(num5, typeof(byte)));
					num2++;
				}
				MemoryStream memoryStream = new MemoryStream();
				CryptoStream cryptoStream = new CryptoStream(memoryStream, tripleDESCryptoServiceProvider.CreateDecryptor(), CryptoStreamMode.Write);
				cryptoStream.Write(array, 0, array.Length);
				cryptoStream.FlushFinalBlock();
				StringBuilder stringBuilder = new StringBuilder();
				byte[] array2 = memoryStream.ToArray();
				memoryStream.Close();
				int num6 = Information.UBound(array2);
				int num7 = 0;
				while (true)
				{
					int num8 = num7;
					int num4 = num6;
					if (num8 > num4)
					{
						break;
					}
					stringBuilder.Append(Strings.Chr(array2[num7]));
					num7++;
				}
				return stringBuilder.ToString();
			}
		}
	}
}
