package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.JoinService;
import member.service.JoinServiceImpl;
import model.Member;
import model.Shop;
import shop.service.ShopService;
import shop.service.ShopServiceImpl;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("utf-8");

		JoinService service = new JoinServiceImpl();
		ShopService s_service = new ShopServiceImpl();
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		Member m = service.getMember(id);
		Shop s = s_service.getShop(id);
		int type = 0;
		String path = "/web/main.jsp";

		if (m != null && pwd.equals(m.getPwd())) {
			type = m.getType();
			String s_name = s.getName();
			session.setAttribute("id", id);
			session.setAttribute("memberType", type);
			session.setAttribute("m", m);
			session.setAttribute("s_name", s_name);
			session.setAttribute("shop", s);
		}

		dispatcher = request.getRequestDispatcher(path);
		if(dispatcher!=null) {
			dispatcher.forward(request, response);
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
