package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.entity.cart;

@Repository
public interface DAO_Order extends JpaRepository<cart, Long>{

	@Query("Select o from cart o Where o.account.username= ?1")
	List<cart> findByUsername(String username);

	/*Summary*/
	@Query(value = "Select count(*) from cart where CreateDate = CAST( GETDATE() AS Date)",nativeQuery= true)
	Long getTodayOrder();

	@Query(value = "Select t.last7Days as 'date', ISNULL(sum(price*quantity),0) as ' totalPayment' "
			+ "From (Select cast(Getdate()as Date) last7Days  "
			+ "	Union all "
			+ "	Select DateAdd(day,-1,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-2,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-3,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-4,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-5,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-6,cast(getdate()as date)) "
			+ "	Union all "
			+ "	Select DateAdd(day,-7,cast(getdate()as date)) "
			+ ") t Left Join cart t1 on cast(t.last7Days as date) = Cast(t1.Createdate as date) "
			+ "left join Odersdetails dt on  t1.Id = dt.order_id "
			+ "Group by cast(t.last7Days as Date)", nativeQuery = true)
	List<Object[]> getRevenueLast7Days();
}
