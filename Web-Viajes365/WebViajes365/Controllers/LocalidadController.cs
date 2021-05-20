using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebViajes365.Models;

namespace WebViajes365.Controllers
{
    public class LocalidadController : Controller
    {
        Viajes365Entities db = new Viajes365Entities();
        // GET: Localidad
        public ActionResult Index()
        {
            List<Localidades> listaLocalidades = db.Localidades.ToList();
            return View(listaLocalidades);
        }

        public ActionResult Agregar ()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Agregar (Localidades oLocalidades)
        {
            db.Localidades.Add(oLocalidades);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Modificar (int id)
        {
            Localidades oLocalidades = db.Localidades.Where(a => a.idLocalidad == id).FirstOrDefault();
            return View(oLocalidades);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Modificar (Localidades oLocalidades)
        {
            Localidades registroanterior = db.Localidades.Find(oLocalidades.idLocalidad);
            registroanterior.Nombre = oLocalidades.Nombre;
            registroanterior.Alojamiento = oLocalidades.Alojamiento;
            registroanterior.Gastronomia = oLocalidades.Gastronomia;
            registroanterior.idDpto = oLocalidades.idDpto;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DetalleLocalidades (int id)
        {
            Localidades Localidades = db.Localidades.Find(id);
            return View(Localidades);

        }

        public ActionResult EliminarLocalidades (int id)
        {
            Localidades Localidades = db.Localidades.Find(id);
            db.Localidades.Remove(Localidades);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}