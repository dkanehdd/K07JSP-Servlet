package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.PagingUtil;

public class ListCtrl extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//DAO객체 생성 및 커넥션풀을 통한 DB연결
		DataroomDAO dao = new DataroomDAO();
		
		//컨트롤러(서블릿) 및 View(JSP)로 전달할 파라미터를 저장하기 위한 맵 컬렉션
		Map param = new HashMap();
		String addQueryString = "";
		
		//검색어 관련 파라미터 처리
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchColumn!=null) {
			//검색어가 있는경우 파라미터를 Map에 저장하고, 쿼리스트링을 만들어준다.
			addQueryString = String.format("searchColumn=%s&searchWord=%s",
					searchColumn, searchWord);
			param.put("Column", searchColumn);
			param.put("Word", searchWord);
		}
		//테이블의 전체 레코드수를 카운트
		int totalRecordCount = dao.getTotalRecordCount(param);
		//전체 레코드수를 Map에 저장한다. 차후 View로 전달한다.
		param.put("totalCount", totalRecordCount);
		
		
///////////////////////////////////////
		ServletContext application = this.getServletContext();
		int pageSize = Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
		int blockPage = Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		System.out.println("전체레코드수:"+totalRecordCount);
		System.out.println("전체페이지수:"+totalPage);
		
		int nowPage = (req.getParameter("nowPage")==null
				|| req.getParameter("nowPage").equals("") ? 1: Integer.parseInt(req.getParameter("nowPage")));
		
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		param.put("start", start);
		param.put("end", end);
		param.put("totalPage", totalPage);
		param.put("nowPage", nowPage);
		param.put("totalRecordCount", totalRecordCount);
		param.put("pageSize", pageSize);
		
		String pagingBS4 = PagingUtil.pagingBS4(totalRecordCount, 
				pageSize, blockPage, nowPage, 
				"../DataRoom/DataList?"+addQueryString);
		String pagingImg = PagingUtil.pagingImg(totalRecordCount, 
				pageSize, blockPage, nowPage, 
				"../DataRoom/DataList?"+addQueryString);
		param.put("pagingBS4", pagingBS4);
		param.put("pagingImg", pagingImg);
///////////////////////////////////////////////////
		
		//테이블의 전체 레코드를 가져와서 List 컬렉션에 저장한다.
		List<DataroomDTO> lists = dao.selectList(param);
		
		//DB연결을 해제하는것이 아니라 커넥션풀에 반납한다.
		dao.close();
		
		//데이터를 request영역에 저장한다.
		req.setAttribute("lists", lists);
		req.setAttribute("map", param);
//		req.setAttribute("test", "매핑확인용");
		
		//영역에 저장된 데이터를 View로 전달하기 위해 포워드 한다.
		req.getRequestDispatcher("/14Dataroom/DataList.jsp")
		.forward(req, resp);
	}
	/*
	만약 게시판 리스트쪽에서 post방식으로 요청이 들어오더라도
	처리는 doGet()에서 처리할 수 있도록 모든 요청을 토스한다.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
