using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebViajes365.Models;

namespace WebViajes365.Controllers
{
    public class ItinerarioController : Controller
    {
        Viajes365Entities db = new Viajes365Entities();
        // GET: Itinerario
        public ActionResult Index()
        {
            List<Itinerario> listaItinerarios = db.Itinerario.ToList();
           
            return View(listaItinerarios);
        }
        public ActionResult Agregar ()
        {
            return View();
        }

        [HttpPatch]
         public ActionResult Agregar (Itinerario oItinerario)
        {
            db.Itinerario.Add(oItinerario);
            db.SaveChanges();
            return RedirectToAction("Index");
                
        }

        public ActionResult Modificar (int id)
        {
            Itinerario oItinerario = db.Itinerario.Where(a => a.idItinerarios == id).FirstOrDefault();
            return View(oItinerario);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Modificar (Itinerario oItinerario)
        {
            Itinerario Registroanterior = db.Itinerario.Find(oItinerario.idItinerarios);
            Registroanterior.Rutas = oItinerario.Rutas;
            Registroanterior.Transporte = oItinerario.Transporte;
            Registroanterior.cantDpto = oItinerario.cantDpto;
            Registroanterior.tipoItinerario = oItinerario.tipoItinerario;
            Registroanterior.kmsRecorridos = oItinerario.kmsRecorridos;
            Registroanterior.hsViaje = oItinerario.hsViaje;
            Registroanterior.idLocalidad = oItinerario.idLocalidad;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DetalleItinerario (int id)
        {
            Itinerario oItinerario = db.Itinerario.Find(id);
            return View(oItinerario);
        }

        public ActionResult EliminarItinerario (int id)
        {
            Itinerario Itinerario = db.Itinerario.Find(id);
            db.Itinerario.Remove(Itinerario);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}