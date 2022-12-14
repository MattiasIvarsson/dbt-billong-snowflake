{% macro birthdate(debtor_id , debtor_id_type) %}
-- Birthdate from SSN 12 chars
 		try_cast
 		(case 	when 	len({{ debtor_id }}) = 12 
 		  		and  	{{ debtor_id_type }} in ('P')	
 		  		then 	left({{ debtor_id }}, 4) 
 		 					+ '-' + substring({{ debtor_id }}, 5, 2) 
 		 					+ '-' + substring({{ debtor_id }}, 7, 2) 
 		
 		  		else 	null
 		 end as date
 		)
{% endmacro %}	