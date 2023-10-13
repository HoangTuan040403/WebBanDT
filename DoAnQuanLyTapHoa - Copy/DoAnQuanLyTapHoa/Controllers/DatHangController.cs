using DoAnQuanLyTapHoa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoAnQuanLyTapHoa.Controllers
{
    public class DatHangController : Controller
    {
        QLBANDTEntities db = new QLBANDTEntities();
        // GET: DatHang
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DatHang(FormCollection form)
        {
            try
            {
                Cart cart = Session["Cart"] as Cart;
                DonHang _order = new DonHang();
                //_order.MaDH = 3; // chỗ này phải để tự nhảy mã đơn ;
                _order.NgayDH = DateTime.Now;
                _order.NguoiNhan = (form["NguoiNhan"]);
                _order.DiaChiNhan = (form["DiaChiNhan"]);
                _order.Sodienthoainhan = (form["SoDTNhan"]);
                db.DonHangs.Add(_order);
                foreach (var item in cart.Items)
                {
                    // lưu dòng sản phẩm vào chi tiết hóa đơn
                    ChiTietDH _order_detail = new ChiTietDH();
                    //_order_detail.MaCTDH = 2;  // chỗ này phải để tự nhảy mã đơn 
                    _order_detail.MaDH = _order.MaDH;
                    _order_detail.MaSP = item._shopping_product.MaSP;
                    _order_detail.Dongia = (int)item._shopping_product.GiaSp;
                    _order_detail.ThanhTien = _order_detail.Dongia * _order_detail.Soluong;
                    db.ChiTietDHs.Add(_order_detail);
                }
                db.SaveChanges();
                cart.ClearCart();
                return RedirectToAction("CheckOut_Success", "XemDonHang");
            }
            catch
            {
                return Content("Có sai sót! Xin kiểm tra lại thông tin"); ;
            }

        }
    }
}