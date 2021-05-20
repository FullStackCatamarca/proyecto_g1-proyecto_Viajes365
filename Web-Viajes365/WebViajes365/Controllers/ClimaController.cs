using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebViajes365.Models;

namespace WebViajes365.Controllers
{
    public class ClimaController : Controller
    {
        Viajes365Entities db = new Viajes365Entities();
        // GET: Clima
        public ActionResult Index()
        {
            List<Clima> listaClima = db.Clima.ToList();
            return View(listaClima);
        }

        public ActionResult Agregar ()
        {
            return View();
        }
        [HttpPost]
         public ActionResult Agregar (Clima oClima)
        {
            db.Clima.Add(oClima);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Modificar (int id)
        {
            Clima oClima = db.Clima.Where(a => a.idClima == id).FirstOrDefault();
            return View(oClima);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Modificar (Clima oClima)
        {
            Clima Registroanterior = db.Clima.Find(oClima.idClima);
            Registroanterior.PronosticoExtendido = oClima.PronosticoExtendido;
            Registroanterior.HistorialClimas = oClima.HistorialClimas;
            Registroanterior.idLocalidad = oClima.idLocalidad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DetalleClima (int id)
        {
            Clima Clima = db.Clima.Find(id);
            return View(Clima);

        }

        public ActionResult EliminarClima (int id)
        {
            Clima Clima = db.Clima.Find(id);
            db.Clima.Remove(Clima);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}