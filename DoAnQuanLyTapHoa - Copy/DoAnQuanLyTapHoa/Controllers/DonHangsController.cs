//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Data.Entity;
//using System.Linq;
//using System.Net;
//using System.Web;
//using System.Web.Mvc;
//using DoAnQuanLyTapHoa.Models;

//namespace DoAnQuanLyTapHoa.Controllers
//{
//    public class DonHangsController : Controller
//    {
//        private QL_CHDTEntities1 db = new QL_CHDTEntities1();

//        // GET: DonHangs
//        public ActionResult Index()
//        {
//            var donHangs = db.DonHangs.Include(d => d.MaKH);
//            return View(donHangs.ToList());
//        }

//        // GET: DonHangs/Details/5
//        public ActionResult Details(string id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            DonHang donHang = db.DonHangs.Find(id);
//            if (donHang == null)
//            {
//                return HttpNotFound();
//            }
//            return View(donHang);
//        }

//        // GET: DonHangs/Create
//        public ActionResult Create()
//        {
//            ViewBag.MaUser = new SelectList(db.Maus, "MaUser", "TenUser");
//            return View();
//        }

//        // POST: DonHangs/Create
//        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
//        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Create([Bind(Include = "MaDH,NgayMua,MaUser,TongTien")] DonHang donHang)
//        {
//            if (ModelState.IsValid)
//            {
//                db.DonHangs.Add(donHang);
//                db.SaveChanges();
//                return RedirectToAction("Index");
//            }

//            ViewBag.MaUser = new SelectList(db.Maus, "MaUser", "TenUser", donHang.MaKH);
//            return View(donHang);
//        }

//        // GET: DonHangs/Edit/5
//        public ActionResult Edit(string id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            DonHang donHang = db.DonHangs.Find(id);
//            if (donHang == null)
//            {
//                return HttpNotFound();
//            }
//            ViewBag.MaUser = new SelectList(db.Maus, "MaUser", "TenUser", donHang.MaKH);
//            return View(donHang);
//        }

//        // POST: DonHangs/Edit/5
//        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
//        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Edit([Bind(Include = "MaDH,NgayMua,MaUser,TongTien")] DonHang donHang)
//        {
//            if (ModelState.IsValid)
//            {
//                db.Entry(donHang).State = EntityState.Modified;
//                db.SaveChanges();
//                return RedirectToAction("Index");
//            }
//            ViewBag.MaUser = new SelectList(db.Maus, "MaUser", "TenUser", donHang.MaKH);
//            return View(donHang);
//        }

//        // GET: DonHangs/Delete/5
//        public ActionResult Delete(string id)
//        {
//            if (id == null)
//            {
//                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
//            }
//            DonHang donHang = db.DonHangs.Find(id);
//            if (donHang == null)
//            {
//                return HttpNotFound();
//            }
//            return View(donHang);
//        }

//        // POST: DonHangs/Delete/5
//        [HttpPost, ActionName("Delete")]
//        [ValidateAntiForgeryToken]
//        public ActionResult DeleteConfirmed(string id)
//        {
//            DonHang donHang = db.DonHangs.Find(id);
//            db.DonHangs.Remove(donHang);
//            db.SaveChanges();
//            return RedirectToAction("Index");
//        }

//        [HttpGet]
//        public ActionResult ThongKeDoanhThu()
//        {
//            var dailyTotal = db.DonHangs.GroupBy(t => DbFunctions.TruncateTime(t.NgayDH)).Select(g => new /*DonHang*/ { NgayDH = g.Key, TongTien = g.Sum(t => t.Trigia) }).ToList();
//            var dailyRevenueList = dailyTotal.Select(d => new DonHang { NgayDH = d.NgayDH, Trigia = d.TongTien }).ToList();
//            return View(dailyRevenueList);
//        }

//        //// hàm tính tổng tiền
//        //public int TongTien()
//        //{
//        //    var total = db.DonHang.Sum(s => s.TongTien);
//        //    return (int)total;
//        //}

//        //hàm hiển thị biểu đồ trong thống kê doanh thu 
//        [HttpGet]
//        public ActionResult BieuDo()
//        {
//            // Gọi phương thức GetChartData để lấy dữ liệu từ cơ sở dữ liệu
//            List<ChartData> chartData = GetChartData();

//            // Truyền dữ liệu biểu đồ xuống View bằng ViewBag hoặc ViewModel
//            ViewBag.ChartData = chartData;

//            return View();
//        }

//        // Phương thức để truy vấn cơ sở dữ liệu và lấy dữ liệu cho biểu đồ
//        private List<ChartData> GetChartData()
//        {
//            // Thực hiện truy vấn cơ sở dữ liệu ở đây và lấy dữ liệu cho biểu đồ
//            // Ví dụ, sử dụng Entity Framework để truy vấn cơ sở dữ liệu:
//            using (var dbContext = new QL_CHDTEntities1())
//            {
//                var data = dbContext.DonHangs
//                    .Select(s => new ChartData
//                    {
//                        Label = s.NgayDH.ToString(), // Tên tháng
//                        //Value = s.TongTien.Value // Số tiền doanh số
//                    })
//                    .ToList();
//                return data;
//            }
//        }

//        protected override void Dispose(bool disposing)
//        {
//            if (disposing)
//            {
//                db.Dispose();
//            }
//            base.Dispose(disposing);
//        }
//    }
//}
