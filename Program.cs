using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.EntityFrameworkCore;
using vulneramecum.Data;
using vulneramecum.Service;

var builder = WebApplication.CreateBuilder(args);

// Configurar AppDbContext con SQL Server
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Servicios de aplicación
builder.Services.AddScoped<VulnerabilityService>();

// Registrar servicios de sesión (si decides mantener sesión)
builder.Services.AddDistributedMemoryCache(); // <- Necesario
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(60);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});

builder.Services.AddHttpContextAccessor();

// Servicios Blazor
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();

var app = builder.Build();

// Configuración del pipeline HTTP
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseSession(); // <- Solo si AddSession y AddDistributedMemoryCache están activos

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
