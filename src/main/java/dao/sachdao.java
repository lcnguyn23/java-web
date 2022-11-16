package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.sachbean;

public class sachdao {
  public ArrayList<sachbean> getsach() {
    try {
      ArrayList<sachbean> ds = new ArrayList<sachbean>();
      // b1: ket noi vao csdl
      KetNoi kn = new KetNoi();
      kn.KetNoi();
      // b2: lay du lieu
      String sql = "select * from sach";
      PreparedStatement cmd = kn.cn.prepareStatement(sql);
      ResultSet rs = cmd.executeQuery();
      // b3: dua du lieu vao mang ds
      while (rs.next()) {
        String masach = rs.getString("masach");
        String tensach = rs.getString("tensach");
        String tacgia = rs.getString("tacgia");
        int soluong = rs.getInt("soluong");
        int gia = rs.getInt("gia");
        String anh = rs.getString("anh");
        String maloai = rs.getString("maloai");
        ds.add(new sachbean(masach, tensach, tacgia, soluong, gia, anh, maloai));
      }
      // b4: dong ket noi
      rs.close();
      kn.cn.close();

      // ds.add(new sachbean("s1", "Cơ sỡ dữ liệu 1", "Lê Nam", 10, 1000, "b1.jpg", "tin"));
      // ds.add(new sachbean("s2", "Cơ sỡ dữ liệu 2", "Lê Nam", 10, 1000, "b2.jpg", "tin"));
      // ds.add(new sachbean("s3", "Cơ sỡ dữ liệu 3", "Lê Nam", 10, 1000, "b3.jpg", "tin"));
      // ds.add(new sachbean("s4", "Giải tích 1", "Lê Nam", 10, 1000, "b4.jpg", "toan"));
      // ds.add(new sachbean("s5", "Giải tích 2", "Lê Tứ", 10, 1000, "b5.jpg", "toan"));
      // ds.add(new sachbean("s6", "Hóa đại cương", "Lê Tam", 10, 1000, "b6.jpg", "hoa"));
      return ds;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
}
