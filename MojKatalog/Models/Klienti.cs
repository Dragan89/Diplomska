//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MojKatalog.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Klienti
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Klienti()
        {
            this.Kompanii = new HashSet<Kompanii>();
            this.Poedinci = new HashSet<Poedinci>();
            this.Poraki = new HashSet<Poraki>();
        }
    
        public int IdKlienti { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string NazivNaFirma { get; set; }
        public string Mail { get; set; }
        public string Telefon { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Kompanii> Kompanii { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Poedinci> Poedinci { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Poraki> Poraki { get; set; }
    }
}
