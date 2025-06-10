using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.EntityFrameworkCore;
using Penman.Blazor.Quill;
using vulneramecum.Data;
using vulneramecum.Service;

var builder = WebApplication.CreateBuilder(args);

// Configuración del contexto de base de datos SQL Server
builder.Services.AddDbContextFactory<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Servicios de aplicación
builder.Services.AddScoped<VulnerabilityService>();

// Soporte para sesión (por si se habilita autenticación u otras funcionalidades)
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(60);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

// Otros servicios
builder.Services.AddHttpContextAccessor();

// Servicios Blazor
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor()
    .AddCircuitOptions(options => options.DetailedErrors = true);

// Soporte para editor Quill
builder.Services.AddPenmanQuill();

var app = builder.Build();

// Pipeline HTTP
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseSession();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

// Autoabrir navegador al iniciar
try
{
    var url = "http://127.0.0.1:5000";
    _ = Task.Run(() =>
    {
        Thread.Sleep(1000); // Esperar a que arranque el servidor
        System.Diagnostics.Process.Start(new System.Diagnostics.ProcessStartInfo
        {
            FileName = url,
            UseShellExecute = true
        });
    });
}
catch
{
    Console.WriteLine("No se pudo abrir el navegador automáticamente. Abre manualmente: http://127.0.0.1:5000");
}

// Lanzar la app
app.Run();
