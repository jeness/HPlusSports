package com.test.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.beans.Product;

public class ApplicationDao {

	public List<Product> searchProducts(String searchString) {
		Product product = null;
		List<Product> products = new ArrayList<>();
		
		try{
			Connection connection = DBConnection.getConnectionToDatabase();
			
			String sql = "select * from products where product_name like '%"+searchString+"%'";
			
			Statement statement = connection.createStatement();
			
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

}
