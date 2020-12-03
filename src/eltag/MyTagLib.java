package eltag;

import model.MemberDAO;

/*
  EL에서 Java클래스의 메소드 호출 절차 및 방법
  1. 클래스와 메소드를 정의한다. 단 메소드정의시 반드시 public static 으로 선언해야한다.
  
 */
public class MyTagLib {
	
	/*
	메소드설명 : 매개변수로 전달된 문자열이 숫자가 아닌 문자가 포함되어있는지 확인하는 메소드
		숫자일때 true, 그렇지않으면 false를 반환.
	 */
	public static boolean isNumber(String value) {
		
		char[] chArr = value.toCharArray();
		for(int i=0; i<chArr.length ; i++) {
			if(!(chArr[i]>='0' && chArr[i]<='9')) {
				return false;
			}
		}
		return true;
	}
	
	/*
	메소드설명 : 매개변수로 주민번호를 전달받아 성별을 판단한다.
		주민번호는 하이픈(-)을 포함한 형태로 전달된다고 가정한다.
	*/
	public static String getGender(String juminNum) {
		//매개변수를 char형 배열에 담는다.
		char[] arr = juminNum.toCharArray();
		//배열의 7번째인덱스의 문자를 비교하여 리턴해준다.
		if(arr[7]=='1'||arr[7]=='3') {
			return "남자";
		}
		else if(arr[7]=='2'||arr[7]=='4'){
			return "여자";
		}
		else {
			return "잘못된 주민번호";
		}
	}
	/*
	아디디, 패스워드, DB연결을 위한 드라이버명, URL을 인자로 전달받아
	회원여부를 판단하여 boolean을 반환해주는 메소드
	 */
	public static boolean memberLogin(
			String id, String pw, String drv, String url) {
		//DB연결을 위한 객체생성
		MemberDAO dao = new MemberDAO(drv, url);
		//아이디, 패스워드를 통한 회원인증 및 결과반환
		boolean isBool = dao.isMember(id, pw);
		//위 결과를 호출한 지점으로 반환
		return isBool;
	}
	//메소드 테스트를 위한 main메소드
	public static void main(String[] args) {
		boolean result1 = isNumber("1234");
		boolean result2 = isNumber("백20");
		System.out.println("결과1 : "+ result1);
		System.out.println("결과2 : "+ result2);
	}
}
