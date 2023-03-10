package db;

import java.util.Map;

public class OLSHelper {

	public static String getSubName(String id) throws Exception {
		Map<String,String> result= DbConfig.findSingle("subjects", "subid="+id);
		return result.get("subname");
	}
	
	public static String getStudentName(String id) throws Exception {
		Map<String,String> result= DbConfig.findSingle("student", "rollno="+id);
		return result.get("name");
	}
	
	public static String getLecturerName(String id) throws Exception {
		Map<String,String> result= DbConfig.findSingle("lecturer", "lid="+id);
		return result.get("lname");
	}
	
	public static String getTestName(String id) throws Exception {
		Map<String,String> result= DbConfig.findSingle("tests", "id="+id);
		return result.get("tname");
	}
	
	public static String getAnswer(String id) throws Exception {
		Map<String,String> result= DbConfig.findSingle("questions", "id="+id);
		return result.get("ans");
	}
	
	public static String getTestRemarks(String tid,String rollno) throws Exception {
		if(Integer.parseInt(DbConfig.findCount("results", "tid="+tid+" and rollno="+rollno))>0) {
		Map<String,String> result= DbConfig.findSingle("results", "tid="+tid+" and rollno="+rollno);
			return result.get("result");
		}else {
			return null;
		}
	}
}
