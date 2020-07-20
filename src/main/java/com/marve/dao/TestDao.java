package com.marve.dao;

import org.springframework.stereotype.Component;

import java.util.LinkedList;
import java.util.List;
import com.marve.entity.Question;

import java.sql.*;

@Component
public class TestDao {
	
	public void addQuestion(String testid,Question t, String qnumber) throws SQLException
	{
		if(CreateConnection.getConnection()==null||CreateConnection.getConnection().isClosed())
		CreateConnection.setConnection();
		Connection con=CreateConnection.getConnection();
				try
		{
			PreparedStatement stmt=con.prepareStatement("insert into test VALUES(?,?,?,?,?,?,?,?)");
			stmt.setInt(1,Integer.valueOf(testid));
			stmt.setString(2,qnumber);
			stmt.setString(3,t.getQuestion());
			stmt.setString(4,t.getOpt1());
			stmt.setString(5,t.getOpt2());
			stmt.setString(6,t.getOpt3());
			stmt.setString(7,t.getOpt4());
			stmt.setString(8,t.getAnswer());
			stmt.executeUpdate();
		}
		catch(Exception e)
		{
			
				con.close();
			System.out.println(e);
			
		}
	}
	


	public List<Question> getTest(String testid) throws SQLException {
		Connection con=CreateConnection.getConnection();
		if(con==null||CreateConnection.getConnection().isClosed())
		{
			CreateConnection.setConnection();
			con=CreateConnection.getConnection();
		}
		List<Question> l=new LinkedList<Question>();
			try
			{
				PreparedStatement stmt=con.prepareStatement("select * from test where testid="+testid);
				ResultSet rs = stmt.executeQuery();
				while(rs.next())
				{
					l.add(new Question(rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
				}
				
				con.close();
			}
			catch(Exception e)
			{
					con.close();
				          
				System.out.println(e);
				
			}
	
		
		return l;
	}

	public int generateTestid(String testname,String user) throws SQLException {
		Connection con=CreateConnection.getConnection();
		if(con==null||CreateConnection.getConnection().isClosed())
		{
			CreateConnection.setConnection();
			con=CreateConnection.getConnection();
		}
		try
		{
			int testid=0;
			PreparedStatement stmt=con.prepareStatement("insert into testes2 values(null,?,?)");
			stmt.setString(1,testname);
			stmt.setString(2,user);
			int i=stmt.executeUpdate();
			if(i!=0)
			{
				 stmt=con.prepareStatement("select Max(testid) from testes2 where username='"+user+"'");
				 ResultSet rs=stmt.executeQuery();
				 if(rs.next())
				 {
					 testid=rs.getInt(1);
					 
				 }
			}
			
			return testid;
		}
		catch(Exception e)
		{
				con.close();
			          
			System.out.println(e);
			
		}
		
		return 0;
	}



	public boolean validateUser(String uname, String psw) throws SQLException {
		Connection con=CreateConnection.getConnection();
		if(con==null||CreateConnection.getConnection().isClosed())
		{
			CreateConnection.setConnection();
			con=CreateConnection.getConnection();
		}
		try
		{
			PreparedStatement stmt=con.prepareStatement("select * from user where email=? and password=?");		
			stmt.setString(1,uname);  
			stmt.setString(2,psw);
	        ResultSet rs=stmt.executeQuery();
	        if(rs.next())
	        {
	        	return true;
	         }
	    	
	        }	
		catch(Exception e)
		{ 
			con.close();
		}
         return false;
	}
}