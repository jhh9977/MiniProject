package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardService;
import board.service.BoardServiceImpl;
import model.Board;
import model.Shop;
import shop.service.ShopService;
import shop.service.ShopServiceImpl;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/BoardListController")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
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
		
		ShopService shopservice = new ShopServiceImpl();
		BoardService boardservice = new BoardServiceImpl();
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		Shop s = (Shop)session.getAttribute("shop");
		ArrayList<Board> boardlist = boardservice.getAllByS_name(s.getName());
		float scoreavg=0;
		System.out.println(boardlist);
//		if(boardlist != null) {
//			scoreavg=boardservice.getAvgScoreByS_name(s.getName());
//			shopservice.editScore(scoreavg, s.getName());
//			s = shopservice.getShop(s.getNum());
//		}
		
		session.setAttribute("shop", s);
		request.setAttribute("boardlist", boardlist);
		
		dispatcher = request.getRequestDispatcher("/web/board/boardList.jsp");
		if(dispatcher != null) 
			dispatcher.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
