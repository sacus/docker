<?php
	$link_id=mysql_connect('localhost','zblog','123456') or mysql_error();
        if($link_id){
		echo "mysql successful by oldboy !";
	}else{
		echo mysql_error();
	}
?>

