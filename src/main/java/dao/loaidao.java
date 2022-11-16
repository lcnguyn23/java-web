package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.loaibean;

public class loaidao {
  public ArrayList<loaibean> getloai() {
    try {
      // Tao 1 mang luu all loai
      ArrayList<loaibean> ds = new ArrayList<loaibean>();
      // b1: ket noi vao csdl
      KetNoi kn = new KetNoi();
      kn.KetNoi();
      // b2: lay du lieu ve
      String sql = "select * from loai";
      PreparedStatement cmd = kn.cn.prepareStatement(sql);
      ResultSet rs = cmd.executeQuery();
      // b3: dua du lieu vao mang ds
      while (rs.next()) {
        String maloai = rs.getString("maloai");
        String tenloai = rs.getString("tenloai");
        ds.add(new loaibean(maloai, tenloai));
      }
      // b4: dong ket noi
      rs.close();
      kn.cn.close();
      return ds;
    } catch (Exception e) {
      e.printStackTrace();
      return null;
    }
  }
}
