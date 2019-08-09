package com.test.dao;

import com.test.beans.Order;
import com.test.beans.Product;
import com.test.beans.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ApplicationDao {

	public List<Product> searchProducts(String searchString, Connection connection) {
		Product product = null;
		List<Product> products = new ArrayList<>();

		try {
//			Connection connection = DBConnection.getConnectionToDatabase();

			String sql = "select * from products where product_name like '%" + searchString + "%'";

			Statement statement = connection.createStatement();

			ResultSet set = statement.executeQuery(sql);

			while (set.next()) {
				product = new Product();
				product.setProductId(set.getInt("product_id"));
				product.setProductImgPath(set.getString("image_path"));
				product.setProductName(set.getString("product_name"));
				products.add(product);

			}

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return products;
	}

	public int registerUser(User user) {
		int rowsAffected = 0;

		try {
			// get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			// write the insert query
			String insertQuery = "insert into users values(?,?,?,?,?,?)";

			// set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(insertQuery);
			statement.setString(1, user.getUsername());
			statement.setString(2, user.getPassword());
			statement.setString(3, user.getFirstName());
			statement.setString(4, user.getLastName());
			statement.setInt(5, user.getAge());
			statement.setString(6, user.getActivity());

			// execute the statement
			rowsAffected = statement.executeUpdate();

		} catch (SQLException exception) {
			exception.printStackTrace();
		}
		return rowsAffected;
	}

	public boolean validateUser(String username, String password){
		boolean isValidUser = false;
		try{
			//get the connection for the database
			Connection connection = DBConnection.getConnectionToDatabase();

			//write the select query
			String sql = "select * from users where username=? and password=?";

			//set parameters with PreparedStatement
			java.sql.PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);

			//execute the statement and check whether user exists
			ResultSet set = statement.executeQuery();
			while(set.next()){
				isValidUser = true;
			}
		}
		catch(SQLException exception) {
					exception.printStackTrace();
		}
		return isValidUser;
	}

	public User getProfileDetails(String username){
		User user = null;
		try{
			//get connection to database
			Connection connection = DBConnection.getConnectionToDatabase();

			//write select query to get profile details
			String sql = "select * from users where username=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);

			//execute query, get resultset and return user info
			ResultSet set = statement.executeQuery();
			while(set.next()){
				user = new User();
				user.setUsername(set.getString("username"));
				user.setFirstName(set.getString("first_name"));
				user.setLastName(set.getString("last_name"));
				user.setActivity(set.getString("activity"));
				user.setAge(set.getInt("age"));
			}
		}
		catch(SQLException exception){
			exception.printStackTrace();
		}
		return user;
	}

	public List<Order> getOrders(String username){
		Order order = null;
		List<Order> orders = new ArrayList<>();
		try {
			//get connection to db
			Connection connection = DBConnection.getConnectionToDatabase();

			//write select query to get order detials
			String sql = "select * from orders where user_name=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			//execute query, get resultset and return user info
			ResultSet set = statement.executeQuery();
			while(set.next()){
				order = new Order();
				order.setOrderId(set.getInt("order_id"));
				order.setProductName(set.getString("product_name"));
				order.setProductImgPath(set.getString("image_path"));
				order.setOrderDate(new Date(set.getDate("order_date").getTime()));
				order.setUsername(set.getString("user_name"));
				orders.add(order);
			}
		}
		catch (SQLException exception){
			exception.printStackTrace();
		}
		return orders;
	}
}
