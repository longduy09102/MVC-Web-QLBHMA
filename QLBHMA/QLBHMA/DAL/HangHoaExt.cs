using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLBHMA.DAL
{
    public partial class HangHoa
    {
        public List<string> Hinhs
        {
            get
            {
                var hinhs = new List<string>();
                if (!string.IsNullOrEmpty(TenHinh))
                {
                    hinhs.AddRange(TenHinh.Split(','));
                }
                else
                {
                    hinhs.Add("noImage.jpg");
                }
                return hinhs;
            }

        }
    }
}