using CmiRrhh.Application.Abstractions;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Webp;
using SixLabors.ImageSharp.Processing;

namespace CmiRrhh.Infrastructure.Imaging;

/// <summary>
/// Reduce a un máximo de 600 px por lado, corrige la orientación EXIF, elimina metadatos
/// (ubicación GPS, cámara, etc.) y guarda en WebP con pérdida (calidad 75).
/// Al volver a codificar la imagen también se descarta cualquier contenido ajeno a los píxeles.
/// </summary>
public sealed class ImageSharpProcesadorImagen : IProcesadorImagen
{
    private const int MaxLado = 600;
    private const int MaxLadoOriginal = 8000; // evita imágenes gigantes que agoten la memoria
    private const int Calidad = 75;

    public ImagenProcesada? Comprimir(byte[] original)
    {
        if (original.Length == 0)
        {
            return null;
        }

        try
        {
            var info = Image.Identify(original);
            if (info.Width > MaxLadoOriginal || info.Height > MaxLadoOriginal)
            {
                return null;
            }

            using var imagen = Image.Load(original);

            imagen.Mutate(x =>
            {
                x.AutoOrient();
                if (imagen.Width > MaxLado || imagen.Height > MaxLado)
                {
                    x.Resize(new ResizeOptions { Mode = ResizeMode.Max, Size = new Size(MaxLado, MaxLado) });
                }
            });

            imagen.Metadata.ExifProfile = null;
            imagen.Metadata.IccProfile = null;
            imagen.Metadata.XmpProfile = null;
            imagen.Metadata.IptcProfile = null;

            using var salida = new MemoryStream();
            // Sin indicar FileFormat, WebpEncoder usa compresión con pérdida (la que buscamos).
            imagen.Save(salida, new WebpEncoder { Quality = Calidad });
            return new ImagenProcesada(salida.ToArray(), "image/webp");
        }
        catch (Exception ex) when (ex is UnknownImageFormatException
                                       or InvalidImageContentException
                                       or NotSupportedException
                                       or ImageProcessingException)
        {
            return null;
        }
    }
}
