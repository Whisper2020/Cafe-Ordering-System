package servletAdd;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Food;
import sql.OrderSql;

import entity.Order;

/**
 * Servlet implementation class add
 */
@WebServlet("/AddOrder")
public class AddOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddOrder() {

		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		final String USER = "JING";
		final String PASSWORD = "password";
		OrderSql orderSql=new OrderSql();
		System.out.println("提交成功");
		try {
			System.out.println("提交成功");
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 加载数据库驱动
			Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery("SELECT * FROM shoppingCart");

			int orderNO= (int) request.getAttribute("orderNO");
			Date now=new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			while (rs.next()) {
				Order order=new Order();
				order.setOrderNo(orderNO+1);
				order.setConsumerName(rs.getString("username"));
				order.setFoodName(rs.getString("foodname"));
				order.setQuantity(rs.getInt("quantity"));
				order.setPrice(rs.getInt("unitprice"));
				order.setOrderDate(df.format(now));
				orderSql.add(order);
				String s="select foodnum from food where foodname= '"+order.getFoodName()+"'";
				ResultSet rs2=stmt.executeQuery(s);
				String sql= "update food set foodNum=" +(rs2.getInt("foodnum")-order.getQuantity()) + " where foodName='" + order.getFoodName()+ "'";
				stmt.executeUpdate(sql);  //库存修改
				sql="delete from shoppingCart where foodname='"+order.getFoodName()+"' and username=' "+order.getConsumerName()+"'";
				stmt.executeUpdate(sql);  //删除购物车数据

			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("menu.jsp");
		// else response.sendRedirect("add.jsp"); 如果输入不符合条件 就继续停留在add界面 由于时间紧迫暂时没写这么细致
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
		System.out.println("ok");
        doPost(request, response);
    }

}
