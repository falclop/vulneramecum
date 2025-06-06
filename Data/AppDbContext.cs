using Microsoft.EntityFrameworkCore;

namespace vulneramecum.Data
{
    public class AppDbContext : DbContext
    {
        // Constructor que recibe las opciones de configuración del contexto
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        // Definición de las entidades del modelo de datos
        public DbSet<Vulnerability> Vulnerabilities => Set<Vulnerability>();
        public DbSet<VulnerabilityImage> VulnerabilityImages => Set<VulnerabilityImage>();
        public DbSet<Example> Examples => Set<Example>();

        // Configuración del modelo de datos
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Vulnerability>()
                .HasMany(v => v.Images)
                .WithOne(i => i.Vulnerability!)
                .HasForeignKey(i => i.VulnerabilityId)
                .OnDelete(DeleteBehavior.Cascade);

            modelBuilder.Entity<Vulnerability>()
                .HasMany(v => v.Examples)
                .WithOne(e => e.Vulnerability!)
                .HasForeignKey(e => e.VulnerabilityId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
