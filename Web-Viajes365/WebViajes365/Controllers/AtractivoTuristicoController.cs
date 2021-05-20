using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebViajes365.Models;

namespace WebViajes365.Controllers
{
    public class AtractivoTuristicoController : Controller
    {
        Viajes365Entities db = new Viajes365Entities();
        // GET: AtractivoTuristico
        public ActionResult Index()
        {
            List<AtractivoTuristico> listaAtractivo = db.AtractivoTuristico.ToList();

            return View(listaAtractivo);
        }

        public ActionResult Agregar ()
        {
            return View();
        }

        [HttpPost]
         public ActionResult Agregar (AtractivoTuristico oAtractivo)
        {
            db.AtractivoTuristico.Add(oAtractivo);
            db.SaveChanges();
            return RedirectToAction("Index");


        }

        public ActionResult Modificar (int id)
        {
            AtractivoTuristico oAtractivo = db.AtractivoTuristico.Where(a => a.idAtractivo == id).FirstOrDefault();
            return View(oAtractivo);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Modificar (AtractivoTuristico oAtractivo)
        {
            AtractivoTuristico Registroanterior = db.AtractivoTuristico.Find(oAtractivo.idAtractivo);
            Registroanterior.tipoAtractivo = oAtractivo.tipoAtractivo;
            Registroanterior.Descripcion = oAtractivo.Descripcion;
            Registroanterior.idLocalidad = oAtractivo.idLocalidad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DetalleAtractivo (int id)
        {
            AtractivoTuristico Atractivo = db.AtractivoTuristico.Find(id);
            return View(Atractivo);
        }

        public ActionResult EliminarAtractivo (int id)
        {
            AtractivoTuristico Atractivo = db.AtractivoTuristico.Find(id);
            db.AtractivoTuristico.Remove(Atractivo);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}