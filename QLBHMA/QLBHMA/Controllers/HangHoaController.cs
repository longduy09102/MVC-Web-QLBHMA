using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using QLBHMA.DAL;
using X.PagedList;

namespace QLBHMA.Controllers
{
    public class HangHoaController : Controller
    {
        QLBHMADbContext db = new QLBHMADbContext();
        #region index
        // GET: HangHoa
        public PartialViewResult _HangHoa(int? id)
        {
            ViewBag.ActiveList = "active";
            List<HangHoa> items = db.HangHoas
                .Where(p => p.LoaiID == id)
                .Take(2)
                .ToList();
            ViewBag.HangHoa = items;
            return PartialView();
        }
        #endregion

        #region Relate Product
        public async Task<ActionResult> ChiTiet(int? id)
        {
            if (id == null || id < 1) return RedirectToAction("Index", "Home");
            try
            {
                //đọc thông tin của 1 mặt hàng thỏa theo ID (bao gồm thông tin về chủng loại )
                HangHoa hangHoa = await db.HangHoas
                    .Include("Loai.ChungLoai")
                    .SingleOrDefaultAsync(p => p.ID == id);
                if (hangHoa == null) throw new Exception($"Mặt hàng ID= {id} không tồn tại.");
                return View(model: hangHoa);
            }
            catch (Exception ex)
            {
                string cauBaoLoi = $"Lỗi truy cập dữ liệu.<br/>Lý do:{ex.Message}";
                return View(viewName: "BaoLoi", model: cauBaoLoi);
            }
        }
        public PartialViewResult _RelateProduct(int? loaiID)
        {
            List<HangHoa> items = db.HangHoas
                .Where(p => p.LoaiID == loaiID)
                .ToList();
            ViewBag.RelateProduct = items;
            return PartialView();
        }
        #endregion

        #region Product
        // GET: /hanghoa/List1
        // GET: /hanghoa/List1?page=2
        public async Task<ActionResult> ShopAjax(int? page)
        {
            ViewBag.ActiveShopAjax = "active";
            //lay ds hang hoa
            int pageNumber = (page == null || page < 1) ? 1 : page.Value;
            int pageSize = 4;
            int n = (pageNumber - 1) * pageSize;
            int toatlItemCount = await db.HangHoas.CountAsync();
            var onePageOfData = await db.HangHoas
                                .OrderByDescending(p => p.ID)
                                .Skip(n)
                                .Take(pageSize)
                                .ToListAsync();

            ViewBag.OnePageOfData = new StaticPagedList<HangHoa>(onePageOfData, pageNumber, pageSize, toatlItemCount);

            ViewBag.TieuDe = "Danh sach san pham";

            if (Request.IsAjaxRequest())
            {
                return PartialView("_ShopAjaxPartial");
            }
            return View();
        }


        // GET: /hanghoa/TraCuuTheoLoai/1
        // GET: /hanghoa/TraCuuTheoLoai/1?page=1
        public async Task<ActionResult> TraCuuTheoLoaiAjax(int? id, int? page)
        {
            if (id == null || id < 0)
            {
                return RedirectToAction("Index", "Home");
            }
            try
            {
                Loai loaiItem = db.Loais.Find(id);
                if (loaiItem == null)
                {
                    //    ViewBag.TieuDe = "Khong co san pham";
                    return View(viewName: "BaoLoi", model: $"Loai {id} khong ton tai san pham");
                }

                ViewBag.TieuDe = $"San pham loai " + loaiItem.Ten;

                int pageNumber = (page == null || page < 1) ? 1 : page.Value;
                int pageSize = 4;
                int n = (pageNumber - 1) * pageSize;
                int toatlItemCount = await db.HangHoas
                                                .Where(p => p.LoaiID == id)
                                                .CountAsync();
                var onePageOfData = await db.HangHoas
                                    .Where(p => p.LoaiID == id)
                                    .OrderByDescending(p => p.ID)
                                    .Skip(n)
                                    .Take(pageSize)
                                    .ToListAsync();
                // Truyen du lieu sang view
                ViewBag.OnePageOfData = new StaticPagedList<HangHoa>(onePageOfData, pageNumber, pageSize, toatlItemCount);
                ViewBag.LoaiID = id;
                // Chi dinh view hien thi
                if (Request.IsAjaxRequest())
                {
                    return PartialView("_ShopAjaxPartial");
                }
                return View("ShopAjax");
            }
            catch (Exception ex)
            {
                return View(viewName: "BaoLoi", model: $"Loi truy cap du lieu {ex.Message}");
            }
        }
        #endregion
    }
}