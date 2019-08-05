package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.test.beans.User;
import com.test.beans.Product;

public class ApplicationDao {

	public List<Product> searchProducts(String searchString) {
		Product product = null;
		List<Product> products = new ArrayList<>();
		
		try{
			//get connection for db
			Connection connection = DBConnection.getConnectionToDatabase();
			
			//write the insert query
			String sql = "select * from products where product_name like '%"+searchString+"%'";
			
			//set the statement with createStatement
			Statement statement = connection.createStatement();
			
			//execute the query with the statement
			ResultSet set = statement.executeQuery(sql);
			
			while(set.next()){
				product= new Product();
				product.setProductId(set.getInt("product_id"));
				product.setProductImgPath(set.getString("image_path"));
				product.setProductName(set.getString("product_name"));
				products.add(product);
				
			}

		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return products;
	}
	
	public int registerUser(User user) {
		int rowsAffacted = 0;
		try {
			//get the connection for the db
			Connection connection = DBConnection.getConnectionToDatabase();
			
			//write the insert query
			String insertQuery = "insert into users values(?,?,?,?,?,?)";
			
			//set paramethers with PreparedStatement
			PreparedStatement ps = connection.prepareStatement(insertQuery);
			ps.setString(1,  user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFirstName());
			ps.setString(4, user.getLastName());
			ps.setInt(5, user.getAge());
			ps.setString(6, user.getActivity());
			
			//execute the statement
			rowsAffacted = ps.executeUpdate();
			
		} catch(SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffacted;
	}

}
