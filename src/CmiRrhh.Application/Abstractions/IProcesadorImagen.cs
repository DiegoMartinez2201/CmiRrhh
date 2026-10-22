namespace CmiRrhh.Application.Abstractions;

/// <summary>Imagen ya procesada, lista para guardarse.</summary>
public sealed record ImagenProcesada(byte[] Bytes, string TipoContenido);

/// <summary>
/// Puerto para validar, redimensionar y comprimir imágenes subidas por el usuario (DIP):
/// la capa web no conoce la librería de imágenes concreta.
/// </summary>
public interface IProcesadorImagen
{
    /// <summary>
    /// Decodifica la imagen (lo que además valida que sea una imagen real), la reduce si excede el
    /// tamaño máximo, elimina sus metadatos y la comprime. Devuelve null si el contenido no es una imagen válida.
    /// </summary>
    ImagenProcesada? Comprimir(byte[] original);
}
