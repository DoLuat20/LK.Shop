package com.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.entity.Product;

public interface Service_Product{

	Page<Product> findAll(Pageable pageable);

	List<Product> findNewProducts();
	
	Page<Product> findByCategoryID(String cid,Pageable pageable);
	List<Product> findAll();
	
    Page<Product> findAllByNameLike(String keywords, Pageable pageable);
	Product findById(Integer productID);

	List<Product> findByCategoryID(String cid);

	Product create(Product product);

	Product update(Product product);

	void delete(Integer id);

	Long getAvailable();

	Long getTotalProduct();

	List<Object[]> numberOfProductSoldByType();

	List<Object[]> getPercentByCate();

	List<Object[]> availableRate();

	List<Object[]> top10Product();

	Page<Product> findByKeywords(String keyword ,Pageable pageable);
	
	Page<Product> findByKeywordsandcate(String keyword, Pageable pageable,String cid);

}
