using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using QLBHMA.DAL;
using QLBHMA.Models;

namespace QLBHMA.Controllers
{
    public class CartAjaxController : Controller
    {
        QLBHMADbContext db = new QLBHMADbContext();
        // GET: Cart
        public ActionResult Index()
        {
            var gioHang = Session["GioHang"] as GioHangModel;
            ViewBag.ShoppingCartAct = "active";
            ViewBag.GioHang = gioHang;
            if (Request.IsAjaxRequest())
                return PartialView("_IndexPartial");
            return View();
        }

        [HttpPost]
        public ActionResult AddToCart(int HangHoaID, int SoLuong = 1)
        {
            var gioHang = Session["GioHang"] as GioHangModel;
            if (gioHang == null)
            {
                gioHang = new GioHangModel();
                Session["GioHang"] = gioHang;
            }
            HangHoa hangHoa = db.HangHoas.Find(HangHoaID);
            var item = new GioHangItem(hangHoa, SoLuong);
            gioHang.Them(item);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Edit(int HangHoaID, int SoLuong)
        {
            var gioHang = Session["GioHang"] as GioHangModel;
            gioHang.HieuChinh(HangHoaID, SoLuong);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult Delete(int HangHoaID)
        {
            var gioHang = Session["GioHang"] as GioHangModel;
            gioHang.Xoa(HangHoaID);
            return RedirectToAction("Index");
        }

        #region Xử lý phát sinh đơn đặt hàng
        [HttpGet]
        public ActionResult DatHang()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DatHang(HoaDon hoaDon)
        {
            var gioHang = Session["GioHang"] as GioHangModel;
            if (gioHang == null || gioHang.TongSanPham == 0)
                return RedirectToAction("Index", "Home");
            try
            {
                hoaDon.NgayDatHang = DateTime.Now;
                hoaDon.TongTien = gioHang.TongTriGia;
                db.HoaDons.Add(hoaDon);
                foreach (var item in gioHang.DanhSach)
                {
                    HoaDonChiTiet ct = new HoaDonChiTiet();
                    ct.HoaDonID = hoaDon.ID;
                    ct.HangHoaID = item.HangHoa.ID;
                    ct.SoLuong = item.SoLuong;
                    ct.DonGia = item.HangHoa.GiaBan;
                    ct.ThanhTien = item.HangHoa.GiaBan * item.SoLuong;
                    db.HoaDonChiTiets.Add(ct);
                }
                await db.SaveChangesAsync();
                gioHang.XoaTatCa();
                return View("DatHangThanhCong", hoaDon);
            }
            catch (Exception ex)
            {

                TempData["LoiDatHang"] = "Đặt hàng không thành công.<br>" + ex.Message;
                return RedirectToAction("Index");
            }
        }
        #endregion
    }
}