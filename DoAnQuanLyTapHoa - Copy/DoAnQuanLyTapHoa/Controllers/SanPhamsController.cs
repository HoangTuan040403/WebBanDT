﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DoAnQuanLyTapHoa.Models;
using System.Globalization;

namespace DoAnQuanLyTapHoa.Controllers
{
    public class SanPhamsController : Controller
    {
        public QLBANDTEntities db = new QLBANDTEntities();

        // GET: SanPhams
        public ActionResult Index()
        {
            var sanPhams = db.SanPhams.Include(s => s.PhanLoai);
            return View(sanPhams.ToList());
        }

        // GET: SanPhams/Details/5
        public ActionResult Details(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: SanPhams/Create
        [HttpGet]
        public ActionResult Create()
        {

            ViewBag.MaLoai = new SelectList(db.PhanLoais, "MaLoai", "TenLoai");
            return View();
        }

        // POST: SanPhams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        //[ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaSP,TenSP, GiaSp, GiaGiam, SoLuong, Hinh1, Hinh2, Hinh3, Hinh4, Hinh5, Mota, Thongso, MaLoai")] SanPham sanPham,
            HttpPostedFileBase Hinh1)
        {
            if (ModelState.IsValid)
            {

                if (Hinh1 != null)
                {
                    //Lấy tên file của hình được up lên
                    var fileName = Path.GetFileName(Hinh1.FileName);
                    //Tạo đường dẫn tới file
                    var path = Path.Combine(Server.MapPath("~Content/images"), fileName);
                    //Lưu tên
                    sanPham.Hinh1 = fileName;
                    //Save vào Images Folder
                    Hinh1.SaveAs(path);
                }

                db.SanPhams.Add(sanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaLoai = new SelectList(db.PhanLoais, "MaLoai", "TenLoai", sanPham.MaLoai);
            return View(sanPham);

            // Lấy tên file của hình được up lên
            //var fileName = Path.GetFileName(Hinh1.FileName);
            ////Tạo đường dẫn tới file
            //var path = Path.Combine(Server.MapPath("~/images"), fileName);
            //if (System.IO.File.Exists(path))
            //{
            //    ViewBag.ThongBao = "Hinh da ton tai";
            //}
            //else
            //{
            //    Hinh1.SaveAs(path);
            //}
            //ViewBag.MaLoai = new SelectList(db.PhanLoais.ToList(), "TenLoai", "MaLoai");
            //return View();
        }

        // GET: SanPhams/Edit/5
        public ActionResult Edit(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoai = new SelectList(db.PhanLoais, "MaLoai", "TenLoai", sanPham.MaLoai);
            return View(sanPham);
        }

        // POST: SanPhams/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaSP,TenSP, GiaSp, GiaGiam, SoLuong, Hinh1, Hinh2, Hinh3, Hinh4, Hinh5, Mota, Thongso, MaLoai")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLoai = new SelectList(db.PhanLoais, "MaLoai", "TenLoai", sanPham.MaLoai);
            return View(sanPham);
        }

        // GET: SanPhams/Delete/5
        public ActionResult Delete(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Products
        [HttpGet]
        public ActionResult ProductList(String searchString)
        {
            // Tạo Products và có tham chiếu đến Loại sản phẩm:
            var products = db.SanPhams.Include(p => p.PhanLoai);

            //Tìm kiếm chuỗi truy vấn theo tên sản phẩm, nếu chuỗi truy vấn SearchString khác rỗng, null
            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(s => s.TenSP.Contains(searchString));
            }
            else
            {
                Console.WriteLine("Không tìm thấy sản phẩm nào");
            }
            return View(products.ToList());

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult MoTa(int id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sach = db.SanPhams.Find(id);
            //var sach = database.SACHes.Where(s => s.Masach == id);
            if (sach == null)
            {
                return HttpNotFound();
            }
            return View(sach);
        }

        [HttpGet]
        public ActionResult TrangHome(String searchString)
        {
            // Tạo Products và có tham chiếu đến Loại sản phẩm:
            var products = db.SanPhams.Include(p => p.PhanLoai);

            //Tìm kiếm chuỗi truy vấn theo tên sản phẩm, nếu chuỗi truy vấn SearchString khác rỗng, null
            if (!String.IsNullOrEmpty(searchString))
            {
                products = products.Where(s => s.TenSP.Contains(searchString));
            }
            else
            {
                Console.WriteLine("Không tìm thấy sản phẩm nào");
            }
            return View(products.ToList());

        }
    }
}
