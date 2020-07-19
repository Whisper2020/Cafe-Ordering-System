package sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import entity.Order;
import helper.DbHelper;

public class OrderSql {
	int num = 0;
	DbHelper db = new DbHelper();
	static Connection conn =null;
	public OrderSql()
	{
		conn =db.getConnection();
	}

	public void add(Order order) throws SQLException {
		Statement state = conn.createStatement(); // 容器
		String sql="insert into orders values ";
        String values="("+order.getOrderNo()+",'"+order.getConsumerName()+"','"+order.getFoodName()+"'," +
				order.getQuantity()+", "+order.getPrice()+", '"+order.getOrderDate()+"')";
        sql+=values;
		state.executeUpdate(sql); // 将sql语句上传至数据库执行
		System.out.println("订单数据添加成功！");

	}

	public void delete(Order order) throws SQLException {
		Statement state = conn.createStatement(); // 容器
    	String sql="delete from orders where orderno='"+order.getOrderNo()+"'";
    	state.executeUpdate(sql); // 将sql语句上传至数据库执行
		System.out.println("订单数据删除成功！");
    	
	}

	
	}



	/*public List<kecheng> getAllUser() throws SQLException {
		Statement state = conn.createStatement();// 容器
		String sql = "select * from kecheng"; // sql语句
		ResultSet rs = state.executeQuery(sql); // 将sql语句传至数据库，返回的值为一个字符集用一个变量接收
		List<kecheng> kclist = new ArrayList<kecheng>();
		while (rs.next()) { // next（）获取里面的内容
			kecheng k = new kecheng();
			k.setClassname(rs.getString(1));
			k.setClassroom(rs.getString(2));
			k.setTeacher(rs.getString(3));
			kclist.add(k);
		}
		// System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3));
		// getString（n）获取第n列的内容
		num = kclist.size(); // 数据库中的列数是从1开始的
		return kclist;
	}

	public int getnum() {

		return num;
	}*/
