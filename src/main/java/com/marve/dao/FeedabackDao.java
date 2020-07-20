package com.marve.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.marve.entity.Feedback;

@Component
public class FeedabackDao {
public void addFeedback(Feedback feedback) throws SQLException
{
	CreateConnection.setConnection();
	Connection con=CreateConnection.getConnection();
	try
	{
	PreparedStatement stmt=con.prepareStatement("insert into feedback VALUES(?,?,?,?,?)");
	stmt.setString(1, feedback.getName());
	stmt.setString(2,feedback.getEmail());
	stmt.setString(3, feedback.getMobile());
	stmt.setString(4, feedback.getCode());
	stmt.setString(5, feedback.getMessage());
	stmt.executeUpdate();
	}
	
	catch(Exception e){
		
	}
	
	finally
	{
		if(con!=null)
		con.close();
		
	}
	
}

public List<Feedback> getFeedbacks() throws SQLException {
	CreateConnection.setConnection();
	Connection con=CreateConnection.getConnection();
	List<Feedback> l=new ArrayList<Feedback>();
	try
	{
	PreparedStatement stmt=con.prepareStatement("select * from feedback");
	ResultSet rs=stmt.executeQuery();
	while(rs.next())
	{
		Feedback fd=new Feedback(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
		l.add(fd);
	}
	}
	catch(Exception e){}
	finally
	{
		if(con!=null)
		con.close();
		
	}
	return l;
}
}
