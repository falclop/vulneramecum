public class ClaveSeguraService
{
    private readonly string _clave;

    public ClaveSeguraService(string clave)
    {
        _clave = clave;
    }

    public Task<bool> EsClaveValidaAsync(string claveUsuario)
    {
        return Task.FromResult(claveUsuario == _clave);
    }
}
