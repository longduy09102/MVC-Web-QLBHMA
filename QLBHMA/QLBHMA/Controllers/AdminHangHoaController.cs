using QLBHMA.DAL;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace QLBHMA.Controllers
{
    public class AdminHangHoaController : Controller
    {
        // GET: AdminHangHoa
        private QLBHMADbContext db = new QLBHMADbContext();

        #region - Xem thong tin

        // GET: AdminHangHoa
        //public async Task<ActionResult> Index()
        //{
        //    var hangHoas = db.HangHoas.Include(h => h.Loai);
        //    return View(await hangHoas.ToListAsync());
        //}

        public ViewResult Index()
        {
            //ViewBag.LoaiAct = "active";
            var query = db.HangHoas
                          .Include(l => l.Loai)// dang dung lazy loading
                          .AsQueryable();
            return View(query);


        }
        #endregion

        // GET: AdminHangHoa/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HangHoa hangHoa = await db.HangHoas.FindAsync(id);
            if (hangHoa == null)
            {
                return HttpNotFound();
            }
            return View(hangHoa);

        }

        // GET: AdminHangHoa/Create
        public ActionResult Create()
        {
            ViewBag.LoaiID = new SelectList(db.Loais, "ID", "MaSo");
            return View();
        }

        // POST: AdminHangHoa/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ID,MaSo,Ten,DonViTinh,MoTa,ThongSoKyThuat,TenHinh,GiaBan,LoaiID,NgayTao,NgayCapNhat")] HangHoa hangHoa)
        {
            if (ModelState.IsValid)
            {
                db.HangHoas.Add(hangHoa);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.LoaiID = new SelectList(db.Loais, "ID", "MaSo", hangHoa.LoaiID);
            return View(hangHoa);
        }

        #region Sua
        // GET: AdminHangHoa/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null || id < 1) return RedirectToAction("Index");
            try
            {
                // Đọc thông tin của 1loai thỏa theo ID (bao gồm thông tin về chủng loại) 
                HangHoa itemHangHoa = await db.HangHoas.FindAsync(id);

                if (itemHangHoa == null) throw new Exception($"Hang hoa ID={id} không tồn tại.");

                List<ChungLoai> chungLoaiItem = await db.ChungLoais.ToListAsync();
                var loaiItem = await db.Loais
                    .Select(p => new {
                        p.ID,
                        ThongTin = p.MaSo + "-" + p.Ten
                    })
                    .ToListAsync();

                loaiItem.Insert(0, new { ID = 0, ThongTin = "---Chon loai---" });
                ViewBag.LoaiID = new SelectList(loaiItem, "ID", "ThongTin", itemHangHoa.LoaiID);
                // Gai su can bao mat tuoc tinh thongsokythuat, khong truyen len view
                //item.ThongSoKyThuat = null;
                return View(model: itemHangHoa);
            }
            catch (Exception ex)
            {
                string cauBaoLoi = $"Lỗi truy cập dữ liệu.<br/>Lý do:{ex.Message}";
                return View(viewName: "BaoLoi", model: cauBaoLoi);
            }
        }

        // POST: AdminHangHoa/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.


        [HttpPost]
        [ValidateAntiForgeryToken]
        // Gia su chi cho sua cac thong tin "ID,MaSo,Ten,DonViTinh,GiaBan,LoaiID"
        public async Task<ActionResult> Edit([Bind(Include = "ID,MaSo,Ten,DonViTinh,MoTa,ThongSoKyThuat,TenHinh,GiaBan,LoaiID")] HangHoa hangHoa)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(hangHoa).State = EntityState.Modified;
                //await db.SaveChangesAsync();
                //return RedirectToAction("Index");

                // Truong hop nhap lieu hop le
                HangHoa hangHoaHC = await db.HangHoas.FindAsync(hangHoa.ID);
                TryUpdateModel(hangHoaHC, new string[] { "ID", "MaSo", "Ten", "DonViTinh", "MoTa", "ThongSoKyThuat", "GiaBan", "LoaiID" });
                hangHoaHC.NgayCapNhat = DateTime.Today;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            // Truong hop nhap lieu khong hop le
            // Tao drop down list
            List<ChungLoai> chungLoaiItem = await db.ChungLoais.ToListAsync();
            var loaiItem = await db.Loais
                .Select(p => new {
                    p.ID,
                    ThongTin = p.MaSo + "-" + p.Ten
                })
                .ToListAsync();

            loaiItem.Insert(0, new { ID = 0, ThongTin = "---Chon loai---" });
            ViewBag.LoaiID = new SelectList(loaiItem, "ID", "ThongTin", hangHoa.LoaiID);

            return View(hangHoa);
        }

        #endregion
        // GET: AdminHangHoa/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HangHoa hangHoa = await db.HangHoas.FindAsync(id);
            if (hangHoa == null)
            {
                return HttpNotFound();
            }
            return View(hangHoa);
        }

        // POST: AdminHangHoa/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            HangHoa hangHoa = await db.HangHoas.FindAsync(id);
            db.HangHoas.Remove(hangHoa);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }



        #region Xử lý Upload file hình
        //GET : Admin/HangHoa/Upload/5
        public async Task<ActionResult> Upload(int? id)
        {
            if (id == null || id < 1) return RedirectToAction("Index");
            try
            {
                HangHoa item = await db.HangHoas.FindAsync(id);
                if (item == null) throw new Exception("ID:" + id + "không tồn tại");
                return View(item);
            }
            catch (Exception ex)
            {
                object cauBaoLoi = "không truy cập được dữ liệu <br/>" + ex.Message;
                return View("AdminError", cauBaoLoi);
            }
        }
        //POST :Admin/HangHoa/Upload/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Upload(int id, HttpPostedFileBase[] taptins)
        {// Upload mới toàn bộ 
            try
            {
                HangHoa item = await db.HangHoas.FindAsync(id);
                if (taptins[0] != null)
                {
                    string duongDan = Server.MapPath("~/Photos/");
                    string dsTen = null;
                    // Cách 1: Giữ nguyên tên
                    //foreach (var f in taptins)
                    //{
                    //    f.SaveAs(duongDan + f.FileName);
                    //    dsTen += $"{f.FileName},";
                    //}

                    // Xóa tất cả file hiện có - trước khi upload lại tòa bộ
                    //var dsTenHinh = item.TenHinh?.Split(',');
                    //if (dsTenHinh != null)
                    //{
                    //    foreach (var tenHinh in dsTenHinh)
                    //    {
                    //        string pathAndFname = Server.MapPath($"~/Photos/{tenHinh}");
                    //        if (System.IO.File.Exists(pathAndFname)) System.IO.File.Delete(pathAndFname);
                    //    }
                    //}

                    // Cách 2: Đổi tên tập tin theo id
                    for (int i = 0; i < taptins.Length; i++)
                    {
                        var f = taptins[i];
                        string kieu = Path.GetExtension(f.FileName);
                        string ten = $"{id}-{i + 1}{kieu}";
                        f.SaveAs(duongDan + ten);
                        dsTen += $"{ten},";
                    }

                    item.TenHinh = dsTen.TrimEnd(',');
                    await db.SaveChangesAsync();
                    // Upload thành công
                    return RedirectToAction("Index");
                }
                // Trường hợp chưa chọn file hoặc file không có nội dung thì quay trở lại view upload
                ViewBag.ThongBao = "Bạn chưa chọn file hoặc file bạn chọn không có nội dung.";
                return View(item);
            }
            catch (Exception ex)
            {
                object cauBaoLoi = "Upload không thành công <br/>" + ex.Message;
                return View("AdminError", cauBaoLoi);
            }
        }
        #endregion



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