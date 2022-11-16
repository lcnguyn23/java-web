package bo;

import java.util.ArrayList;
import bean.giohangbean;

public class giohangbo {
  public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();

  public void Them(String masach, String tensach, long gia, long soluong) {
    for (giohangbean h : ds)
      if (h.getMasach().equals(masach)) {
        h.setSoluong(h.getSoluong() + soluong);
        return;
      }
    ds.add(new giohangbean(masach, tensach, gia, soluong));
  }

  public long TongTien() {
    long s = 0;
    for (giohangbean h : ds)
      s = s + h.getThanhtien();
    return s;
  }

  public void Xoa(String masach) {
    ArrayList<giohangbean> revmoveElem = new ArrayList<giohangbean>();
    for (giohangbean h : ds)
      if (h.getMasach().equals(masach))
        revmoveElem.add(h);
    ds.removeAll(revmoveElem);
  }
}


