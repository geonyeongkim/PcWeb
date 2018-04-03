package kr.ac.skuniver.member;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
@Repository
public class MemberDAO {
 public List<MemberVO> getMemberList(){
  List<MemberVO> memberList=new ArrayList<>();
  //1. 필요한 객체 선언
   Connection conn=null;
   PreparedStatement ps=null;
   ResultSet rs=null;
   try{
   //3. 드라이버 로딩
   //4. DB접속
    conn=DBUtil.getConnection("pccafe", "666666");
   //5. 쿼리작성
    ps=conn.prepareStatement("select * from pcuser1");
   //6. 쿼리 실행
    rs=ps.executeQuery();
   //7. 결과값 처리
    while(rs.next()){
     MemberVO vo=new MemberVO();
     vo.setName(rs.getString(1));
     vo.setId(rs.getString(2));
     vo.setPassword(rs.getString(3));
     vo.setBirth(rs.getString(4));
     vo.setPhone(rs.getString(5));
     vo.setRegDate(rs.getString(6));
     vo.setTime(rs.getString(7));
     vo.setSeatnumber(rs.getString(8));
     memberList.add(vo);
    }
   }catch (Exception e) {
    e.printStackTrace();
   }finally {
    DBUtil.close(conn, ps,rs);
    //2. 선언한 객체들 닫기
   }
 return memberList;  
 }
 
 public MemberVO getMember(String id){
   MemberVO vo=null;
   //1. 필요한 객체 선언
    Connection conn=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    try{
    //3. 드라이버 로딩
    //4. DB접속
     conn=DBUtil.getConnection("pccafe", "666666");
    //5. 쿼리작성
     ps=conn.prepareStatement("select * from pcuser1 where user_Id=?");
     ps.setString(1,id);
    //6. 쿼리 실행
     rs=ps.executeQuery();
    //7. 결과값 처리
     if(rs.next()){
      vo=new MemberVO();
      vo.setName(rs.getString(1));
      vo.setId(rs.getString(2));
      vo.setPassword(rs.getString(3));
      vo.setBirth(rs.getString(4));
      vo.setPhone(rs.getString(5));
      vo.setRegDate(rs.getString(6));
      vo.setTime(rs.getString(7));
      vo.setSeatnumber(rs.getString(8));
     }
    }catch (Exception e) {
     e.printStackTrace();
    }finally {
     DBUtil.close(conn, ps,rs);
     //2. 선언한 객체들 닫기
    }
  return vo;
  
 }
 public MemberVO getMembernumber(String seatnumber){
	   MemberVO vo=null;
	   //1. 필요한 객체 선언
	    Connection conn=null;
	    PreparedStatement ps=null;
	    ResultSet rs=null;
	    try{
	    //3. 드라이버 로딩
	    //4. DB접속
	     conn=DBUtil.getConnection("pccafe", "666666");
	    //5. 쿼리작성
	     ps=conn.prepareStatement("select * from pcuser1 where seatnumber=?");
	     ps.setString(1,seatnumber);
	    //6. 쿼리 실행
	     rs=ps.executeQuery();
	    //7. 결과값 처리
	     if(rs.next()){
	      vo=new MemberVO();
	      vo.setName(rs.getString(1));
	      vo.setId(rs.getString(2));
	      vo.setPassword(rs.getString(3));
	      vo.setBirth(rs.getString(4));
	      vo.setPhone(rs.getString(5));
	      vo.setRegDate(rs.getString(6));
	      vo.setTime(rs.getString(7));
	      vo.setSeatnumber(rs.getString(8));
	     }
	    }catch (Exception e) {
	     e.printStackTrace();
	    }finally {
	     DBUtil.close(conn, ps,rs);
	     //2. 선언한 객체들 닫기
	    }
	  return vo;
	 }
 public MemberVO getMember(String name,String birth){
  MemberVO vo=null;
  //1. 필요한 객체 선언
   Connection conn=null;
   PreparedStatement ps=null;
   ResultSet rs=null;
   try{
   //3. 드라이버 로딩
   //4. DB접속
    conn=DBUtil.getConnection("pccafe", "666666");
   //5. 쿼리작성
    ps=conn.prepareStatement("select * from pcuser1 where (user_Name=? AND user_Birth=?)");
    ps.setString(1,name);
    ps.setString(2,birth);
    
   //6. 쿼리 실행
    rs=ps.executeQuery();
   //7. 결과값 처리
    if(rs.next()){
     vo=new MemberVO();
     vo.setName(rs.getString(1));
     vo.setId(rs.getString(2));
     vo.setPassword(rs.getString(3));
     vo.setBirth(rs.getString(4));
     vo.setPhone(rs.getString(5));
     vo.setRegDate(rs.getString(6));
    }
   }catch (Exception e) {
    e.printStackTrace();
   }finally {
    DBUtil.close(conn, ps,rs);
    //2. 선언한 객체들 닫기
   }
 return vo;
 
}
 Connection conn=null;
 PreparedStatement ps=null;
 ResultSet rs=null;
 public boolean updateMember(MemberVO vo){
  boolean resultflag=false;
  //1. 필요한 객체 선언...DB접속(connection),쿼리작성및 실행(PreparedStatement)
    try{
     conn=DBUtil.getConnection("pccafe","666666");
     //5.쿼리문 작성
     String sql="update pcuser1 set user_Name=?,user_Password=?,user_Birth=?,user_Phone=? where user_Id=?";
     ps=conn.prepareStatement(sql);
     ps.setString(1, vo.getName());
     ps.setString(2, vo.getPassword());
     ps.setString(3, vo.getBirth());
     ps.setString(4, vo.getPhone());
     ps.setString(5, vo.getId());
     //6.쿼리 실행
     int resultCount=ps.executeUpdate();  
     
     if(resultCount>0){
      resultflag=true;
     }
    }catch (Exception e) {
     e.printStackTrace();
    }finally {
     DBUtil.close(conn, ps);
    }
    return resultflag;
   }
 
 public boolean insertMember(MemberVO vo){
  boolean resultflag=false;
  
  //1. 필요한 객체 선언...DB접속(connection),쿼리작성및 실행(PreparedStatement)
    try{
     conn=DBUtil.getConnection("pccafe","666666");
     //5.쿼리문 작성
     String sql="insert into pcuser1 (user_Id,user_Name,user_Password,user_Birth,user_Phone,reg_date,time,seatnumber) values(?,?,?,?,?,sysdate,0,50)";
     ps=conn.prepareStatement(sql);
     ps.setString(1, vo.getId());
     ps.setString(2, vo.getName());
     ps.setString(3, vo.getPassword());
     ps.setString(4, vo.getBirth());
     ps.setString(5, vo.getPhone());
     //6.쿼리 실행
     int resultCount=ps.executeUpdate();   
     
     if(resultCount>0){
      resultflag=true;
     }
    }catch (Exception e) {
     e.printStackTrace();
    }finally {
     DBUtil.close(conn, ps);
    }
    return resultflag;
   }
 
 public boolean deleteMember(MemberVO vo){
  boolean resultflag=false;
  
  //1. 필요한 객체 선언...DB접속(connection),쿼리작성및 실행(PreparedStatement)
    try{
     conn=DBUtil.getConnection("pccafe","666666");
     //5.쿼리문 작성
     String sql="delete pcuser1 where user_Id=?";
     ps=conn.prepareStatement(sql);
     ps.setString(1, vo.getId());
     
     //6.쿼리 실행
     int resultCount=ps.executeUpdate();   
     
     if(resultCount>0){
      resultflag=true;
     }
    }catch (Exception e) {
     e.printStackTrace();
    }finally {
     DBUtil.close(conn, ps);
    }
    return resultflag;
   }
 public boolean updateTime(MemberVO vo){
  boolean resultflag=false;
  //1. 필요한 객체 선언...DB접속(connection),쿼리작성및 실행(PreparedStatement)
    try{
     conn=DBUtil.getConnection("pccafe","666666");
     //5.쿼리문 작성
     String sql="update pcuser1 set time=? where user_Id=?";
     ps=conn.prepareStatement(sql);
     ps.setString(1, vo.getTime());
     ps.setString(2, vo.getId());
     //6.쿼리 실행
     int resultCount=ps.executeUpdate();  
     
     if(resultCount>0){
      resultflag=true;
     }
    }catch (Exception e) {
     e.printStackTrace();
    }finally {
     DBUtil.close(conn, ps);
    }
    return resultflag;
   }
 public boolean updateSeatNumber(MemberVO vo){
	  boolean resultflag=false;
	  //1. 필요한 객체 선언...DB접속(connection),쿼리작성및 실행(PreparedStatement)
	    try{
	     conn=DBUtil.getConnection("pccafe","666666");
	     //5.쿼리문 작성
	     String sql="update pcuser1 set seatnumber=? where user_Id=?";
	     ps=conn.prepareStatement(sql);
	     ps.setString(1, vo.getSeatnumber());
	     ps.setString(2, vo.getId());
	     //6.쿼리 실행
	     int resultCount=ps.executeUpdate();  
	     
	     if(resultCount>0){
	      resultflag=true;
	     }
	    }catch (Exception e) {
	     e.printStackTrace();
	    }finally {
	     DBUtil.close(conn, ps);
	    }
	    return resultflag;
	   }
}
 
