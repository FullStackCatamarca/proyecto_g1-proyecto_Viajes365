using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebViajes365.Models;

namespace WebViajes365.Controllers
{
    public class UsuarioController : Controller
    {
        Viajes365Entities db = new Viajes365Entities();
        // GET: Usuario
        public ActionResult Index()
        {
            List<Usuario> listaUsuario = db.Usuario.ToList();
            return View(listaUsuario);
        }

        public ActionResult Agregar ()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Agregar (Usuario oUsuario)
        {
            db.Usuario.Add(oUsuario);
            db.SaveChanges();
            return RedirectToAction ("Index");
        }

        public ActionResult Modificar (int id)
        {
            Usuario oUsuario = db.Usuario.Where(a => a.idUsuario == id).FirstOrDefault();
            return View(oUsuario);

        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Modificar (Usuario oUsuario)

        {
            Usuario Registroanterior = db.Usuario.Find(oUsuario.idUsuario);
            Registroanterior.Nombre = oUsuario.Nombre;
            Registroanterior.Apellido = oUsuario.Apellido;
            Registroanterior.NombreUsuario = oUsuario.NombreUsuario;
            Registroanterior.Email = oUsuario.Email;
            Registroanterior.Contraseña = oUsuario.Contraseña;
            Registroanterior.FechaRegistro = oUsuario.FechaRegistro;
            Registroanterior.idItinerarios = oUsuario.idItinerarios;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DetalleUsuario (int id)
        {
            Usuario Usuarios = db.Usuario.Find(id);
            return View(Usuarios);
        }

        public ActionResult EliminarUsuario (int id)
        {
            Usuario Usuarios = db.Usuario.Find(id);
            db.Usuario.Remove(Usuarios);
            db.SaveChanges();
            return RedirectToAction ("Index");
        }
    }
}