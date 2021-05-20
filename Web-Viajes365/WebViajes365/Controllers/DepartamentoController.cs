using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebViajes365.Models;

namespace WebViajes365.Controllers
{
    public class DepartamentoController : Controller
    {
        Viajes365Entities db = new Viajes365Entities();
        // GET: Departamento
        public ActionResult Index()
        {
            List<Departamentos> listaDepartamento = db.Departamentos.ToList();
            return View(listaDepartamento);
        }

        public ActionResult Agregar ()
        {
            return View();
        }
        [HttpPost]

        public ActionResult Agregar (Departamentos oDepartamento)
        {
            db.Departamentos.Add(oDepartamento);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Modificar (int id)
        {
            Departamentos oDepartamentos = db.Departamentos.Where(a => a.idDpto == id).FirstOrDefault();
            return View(oDepartamentos);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Modificar (Departamentos oDepartamento)
        {
            Departamentos Registroanterior = db.Departamentos.Find(oDepartamento.idDpto);
            Registroanterior.Nombre = oDepartamento.Nombre;
            Registroanterior.cant_Itinerarios = oDepartamento.cant_Itinerarios;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DetalleDepartamento (int id)
        {
            Departamentos Departamento = db.Departamentos.Find(id);
            return View(Departamento);
        }

        public ActionResult EliminarDepartamento (int id)
        {
            Departamentos Departamentos = db.Departamentos.Find(id);
            db.Departamentos.Remove(Departamentos);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}