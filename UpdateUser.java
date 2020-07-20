package servletUpdate;
 
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sql.FoodSql;
import sql.UserSql;
import entity.Food;
import entity.User;
 
/**
 * Servlet implementation class add
 */
@WebServlet("/UpateUser")
public class UpdateUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUser() {

        super();
       	//System.out.println("yeah add");
        // TODO Auto-generated constructor stub
    }
 
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //int i=0,j=1,k=0;
        //System.out.println("yeah add");
        response.getWriter().append("Served at: ").append(request.getContextPath());
        int have = 0;
        String userAddress=request.getParameter("userAddress");//防止中文乱码
         String userEmail=request.getParameter("userEmail");
         String userName ="";//=request.getParameter("userName");
         String userPassword=request.getParameter("userPassword");
         String userPhone=request.getParameter("userPhone");
         String userGender=request.getParameter("userGender");
         String userBirthday=request.getParameter("userBirthday");
      
         Cookie[] cookies = request.getCookies();
       //保存有cookie对象
       if(cookies != null && cookies.length > 0){
       	for(Cookie c: cookies)
       		if(c.getName().equals("user")){
       			userName = c.getValue();
       			have = 1;
       	}
       }
       if (have == 0)
    	   response.sendRedirect("login.jsp");//页面跳转
         User user=new User();
         user.setUserAddress(userAddress);
         user.setUserEmail(userEmail);
         user.setUserName(userName);
         user.setUserPassword(userPassword);
         user.setUserPhone(userPhone);
         user.setUserGender(userGender);
         user.setUserBirthday(userBirthday);
        UserSql userSql=new UserSql();
             
        try {
         	System.out.println("update user.");
			userSql.update(user,user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        response.sendRedirect("menu.jsp");//页面跳转
        }
        //else response.sendRedirect("add.jsp"); 如果输入不符合条件 就继续停留在add界面 由于时间紧迫暂时没写这么细致
         
    
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(request, response);
    }
 
}
