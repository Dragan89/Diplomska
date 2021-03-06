﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MojKatalog.Models.ViewModels;
using MojKatalog.Models;
using MojKatalog.Helpers.Enumerations;
using System.Data.Entity;

namespace MojKatalog.Queries
{
    public class KataloziIdINaziv
    {
        public int idkatalozi { get; set; }
        public string naziv { get; set; }
    }
    public class QKatalog
    {
        //
        // GET: /QKatalog/
        dbKatalogEntities _db = new dbKatalogEntities();
        QKategorija kategorii = new QKategorija();
        public void DodadiKatalog(Katalozi katalog)
        {
            _db.Katalozi.Add(katalog);
            _db.SaveChanges();
        }


        public List<ViewKataloziKategorii> IzlistajKatalozi(int id, LogedUserTypeEnum userType)
        {
            string stringpom;
            List<Katalozi> katalozi = AllKatalozi(id, userType);
            List<ViewKataloziKategorii> kataloziIkategorii = new List<ViewKataloziKategorii>();

            foreach(var katalog in katalozi)
            {
                stringpom = ConvertStringListToString(katalog.Kategorii
                    .Where(x => x.RoditelId == null)
                    .Select(x => x.NazivNaKategorija)
                    .ToList());

                kataloziIkategorii.Add(new ViewKataloziKategorii
                {
                                IdKatalog = katalog.IdKatalozi,
                                Naziv = katalog.NazivNaKatalog,
                                Opis = katalog.OpisNaKatalog,
                                DataNaKreiranje = katalog.DataNaKreiranje,
                                ViewKategorii = stringpom
                              });
            }

            return kataloziIkategorii.ToList();
        }
        public Katalozi VratiKatalog(int id)
        {
            return _db.Katalozi.Find(id);
        }
        public void IzmeniKatalog(Katalozi newKatalog)
        {
            Katalozi katalog = VratiKatalog(newKatalog.IdKatalozi);
            katalog.NazivNaKatalog = newKatalog.NazivNaKatalog;
            katalog.OpisNaKatalog = newKatalog.OpisNaKatalog;
            _db.SaveChanges();
        }
        public void IzbrisiKatalog(int id)
        {
            Katalozi katalog = _db.Katalozi.Find(id);
            _db.Katalozi.Remove(katalog);
            _db.SaveChanges();
        }
        public KataloziIdINaziv[] KataloziIdINaziv(int id, LogedUserTypeEnum userType)
        {
            if(userType == LogedUserTypeEnum.Poedinec)
                return _db.Katalozi.Where(x => x.IdPoedinci == id)
                .Select(x => new KataloziIdINaziv { idkatalozi = x.IdKatalozi, naziv = x.NazivNaKatalog })
                .ToArray();
            else
                return _db.Katalozi.Where(x => x.IdKompanii == id)
                .Select(x => new KataloziIdINaziv { idkatalozi = x.IdKatalozi, naziv = x.NazivNaKatalog })
                .ToArray();

        }
        public List<Katalozi> AllKatalozi(int id, LogedUserTypeEnum userType)
        {
            if (userType == LogedUserTypeEnum.Poedinec)
            {
                return _db.Katalozi.Include(x => x.Kategorii).Where(x => x.IdPoedinci == id).ToList();
            }
            else
            {
                return _db.Katalozi.Include(x => x.Kategorii).Where(x => x.IdKompanii == id).ToList();
            }
            
        }

        public List<PublishedWebSiteViewModel> GetAllPublishedWebSites()
        {
            var models = _db.Katalozi.Include(x => x.Kategorii).Include(x => x.Poedinci).Include(x => x.WebSiteSettings)
                .Where(x => x.WebSiteSettings != null && x.WebSiteSettings.Objaven == true)
                .Select(x => new PublishedWebSiteViewModel
                {
                    WebSiteId = x.IdKatalozi,
                    DataNaKreiranje = x.DataNaKreiranje,
                    ImageUrl = (x.WebSiteSettings != null && x.WebSiteSettings.CoverUrl != null && x.WebSiteSettings.CoverUrl != "")
                    ? x.WebSiteSettings.CoverUrl : "/Areas/Portfolio/Images/portfolio.jpg",
                    Naziv = (x.WebSiteSettings != null) ? x.WebSiteSettings.Naziv : "",
                    Opis = x.OpisNaKatalog,
                    Sopstvenik = (x.Kompanii != null) ? x.Kompanii.NazivNaKompanija : x.Poedinci.Ime + " " + x.Poedinci.Prezime 
                })
                .ToList();

            return models;
        }

        private string ConvertStringListToString(List<string> lista)
        {
            string resultString = "";
            if (lista.Count() == 0)
            {
                lista.Add("");
            }
            foreach (string elem in lista)
            {
                resultString = resultString + elem + ",";
            }
            resultString = resultString.Remove(resultString.Length - 1, 1);
            return resultString;
        }

    }
}
