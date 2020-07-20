package com.marve.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.marve.entity.Candidate;

@Component
public class CandidateDao {
public void addResult(Candidate c) throws SQLException
{
	Connection con=CreateConnection.getConnection();
	if(con!=null)
	{
	CreateConnection.setConnection();
	con=CreateConnection.getConnection();
	}
	try
	{
	PreparedStatement stmt=con.prepareStatement("insert into candidates VALUES(?,?,?,?,?)");
	stmt.setString(1,c.getRoll());
	stmt.setString(2,c.getTestid());
	stmt.setString(3,c.getUser());
	stmt.setString(4,c.getEmail());
	stmt.setInt(5,c.getMarks());
	stmt.executeUpdate();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	finally
	{
		if(con!=null)
		con.close();
	}
}

public boolean isValidate(Candidate c)
{
	CreateConnection.setConnection();
	Connection con=CreateConnection.getConnection();
	try
	{
	PreparedStatement stmt=con.prepareStatement("select * from candidates where testid="+c.getTestid()+" and roll="+c.getRoll());
	ResultSet rs=stmt.executeQuery();
	if(rs.next())
	{
		con.close();
		return false;
	}
	
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	
	return true;
	
}
}
