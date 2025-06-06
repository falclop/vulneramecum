using System;

namespace vulneramecum.Data
{
    public class Example
    {
        public int Id { get; set; }
        public int VulnerabilityId { get; set; }
        public string PropertyName { get; set; } = string.Empty;
        public string ClassName { get; set; } = string.Empty;
        public string CommitHash { get; set; } = string.Empty;
        public DateTime CommitDate { get; set; }

        public Vulnerability? Vulnerability { get; set; }
    }
}
