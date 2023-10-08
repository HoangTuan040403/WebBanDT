using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DoAnQuanLyTapHoa.Models;

namespace DoAnQuanLyTapHoa.Controllers
{
    public class PhanLoaisController : Controller
    {
        private QLBANDTEntities db = new QLBANDTEntities();

        // GET: PhanLoais
        public ActionResult Index()
        {
            return View(db.PhanLoais.ToList());
        }

        // GET: PhanLoais/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoai phanLoai = db.PhanLoais.Find(id);
            if (phanLoai == null)
            {
                return HttpNotFound();
            }
            return View(phanLoai);
        }

        // GET: PhanLoais/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PhanLoais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Tenloai,MaLoai")] PhanLoai phanLoai)
        {
            if (ModelState.IsValid)
            {
                db.PhanLoais.Add(phanLoai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(phanLoai);
        }

        // GET: PhanLoais/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoai phanLoai = db.PhanLoais.Find(id);
            if (phanLoai == null)
            {
                return HttpNotFound();
            }
            return View(phanLoai);
        }

        // POST: PhanLoais/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Tenloai,MaLoai")] PhanLoai phanLoai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phanLoai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(phanLoai);
        }

        // GET: PhanLoais/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhanLoai phanLoai = db.PhanLoais.Find(id);
            if (phanLoai == null)
            {
                return HttpNotFound();
            }
            return View(phanLoai);
        }

        // POST: PhanLoais/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PhanLoai phanLoai = db.PhanLoais.Find(id);
            db.PhanLoais.Remove(phanLoai);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
