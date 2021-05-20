using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebViajes365.Models;

namespace WebViajes365.Controllers
{
    public class ChatController : Controller
    {
        Viajes365Entities db = new Viajes365Entities();
        // GET: Chat
        public ActionResult Index()
        {
            List<Chat> listaChat = db.Chat.ToList();
            return View(listaChat);
        }

        public ActionResult Agregar ()
        {
            return View();
        }

        [HttpPost]

        public ActionResult Agregar (Chat oChat)
        {
            db.Chat.Add(oChat);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Modificar (int id)
        {
            Chat oChat = db.Chat.Where(a => a.idChat == id).FirstOrDefault();
            return View(oChat);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Modificar (Chat oChat)
        {
            Chat Registroanterior = db.Chat.Find(oChat.idChat);
            Registroanterior.Consulta = oChat.Consulta;
            Registroanterior.idUsuario = oChat.idUsuario;
            db.SaveChanges();
            return RedirectToAction("Index");

        }

        public ActionResult DetalleChat (int id)
        {
            Chat Chat = db.Chat.Find(id);
            return View(Chat);
        }

        public ActionResult EliminarChat (int id)
        {
            Chat Chat = db.Chat.Find(id);
            db.Chat.Remove(Chat);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}