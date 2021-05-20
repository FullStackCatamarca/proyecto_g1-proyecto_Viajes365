using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebViajes365.Models;

namespace WebViajes365.Controllers
{
    public class ForoController : Controller
    {
        Viajes365Entities db = new Viajes365Entities();
        // GET: Foro
        public ActionResult Index()
        {
            List<Foro> listaForo = db.Foro.ToList();

            return View(listaForo);
        }

        public ActionResult Agregar ()
        {
            return View();
        }

        [HttpPost]

        public ActionResult Agregar (Foro oForo)
        {
            db.Foro.Add(oForo);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        public ActionResult Modificar (int id)
        {
            Foro oForo = db.Foro.Where(a => a.idForo == id).FirstOrDefault();
            return View(oForo);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Modificar (Foro oForo)
        {
            Foro Registroanterior = db.Foro.Find(oForo.idForo);
            Registroanterior.Procedencia = oForo.Procedencia;
            Registroanterior.MotivoVisita = oForo.MotivoVisita;
            Registroanterior.Conformidad = oForo.Conformidad;
            Registroanterior.Post = oForo.Post;
            Registroanterior.idUsuario = oForo.idUsuario;
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        public ActionResult DetalleForo (int id)
        {
            Foro Foro = db.Foro.Find(id);
            return View(Foro);
        }

        public ActionResult EliminarForo (int id)
        {
            Foro Foro = db.Foro.Find(id);
            db.Foro.Remove(Foro);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}