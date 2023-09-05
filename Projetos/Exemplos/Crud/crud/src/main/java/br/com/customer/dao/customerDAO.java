package br.com.customer.dao;

import br.com.customer.factory.ConnectionFactory;
import br.com.customer.model.customer;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.util.Date;


public class customerDAO {
	/*
	 * CRUD
	 * c: CREATE
	 * r: READ
	 * u: UPDATE
	 * d: DELETE
	 */
	
	public static void save(customer Customer) {
		String sql = "INSERT INTO customer customer(primeironome,ultimonome,email,birthday) values()";
		 Connection conn = null;
		 PreparedStatement pstm = null;
		 
		 try {
			 //conecta ao banco
			 conn = ConnectionFactory.createConnectionToMySQL();
			 
			 //executa a query
			 pstm = (PreparedStatement) conn.prepareStatement(sql);
			 pstm.setString(2,Customer.getfirstname());
			 pstm.setString(3,Customer.getlastname());
			 pstm.setInt(4, Customer.getAge());
			 pstm.setString(5, Customer.getEmail());
			 pstm.setDate(6, (java.sql.Date) new Date(Customer.getBirthday().getTime()));
			 
			 pstm.execute();
		 }catch(Exception e) {
			 e.printStackTrace();
		 }finally {
			 //fechar as conexões
			 try {
				 if(pstm!=null) {
					 pstm.close();
				 }
				 if(conn!=null) {
					 conn.close();
				 }
			 }catch (Exception e){
				 e.printStackTrace();
			 }
		 }
	}
}