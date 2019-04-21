<?php
include('top.php');
?>	
<div class="container" id="nhanxet">
	<form class="container-fluid " method="post">
		<div class="form-group col-xs-12 col-sm-12 col-md-12" id="nhanxettitle">Nhận xét về dịch vụ</div>
		<div class="form-group col-xs-12 col-sm-6 col-md-5 col-md-offset-2">
			<label for="exampleFormControlInput1" style="color: #fff">Tên của bạn</label>
			<input name="ten" type="text" class="form-control" id="exampleFormControlInput1" placeholder="name">
		</div>
		<div class="form-group col-xs-12 col-sm-6 col-md-2 col-md-offset-1">
			<label for="exampleFormControlSelect1" style="color: #fff">Đánh Giá</label>
			<select name="sao" class="form-control" id="exampleFormControlSelect1">
				<option>5</option>
				<option>4</option>
				<option>3</option>
				<option>2</option>
				<option>1</option>
			</select>
		</div>


		<div class="form-group col-xs-12 col-sm-12 col-md-8 col-md-offset-2">
			<label for="exampleFormControlTextarea1" style="color: #fff">Nhận Xét</label>
			<textarea name="nhanxet" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-2 col-md-offset-5">
			<button name="dangnhanxet" type="submit" class="btn btn-primary">Đăng Nhận Xét</button>
		</div>
	</form>
	<?php

	if(isset($_POST['dangnhanxet']))
	{
		$dem=-1;	
		date_default_timezone_set("Asia/Ho_Chi_Minh");
		$startdate=getdate();
		$dateMuon=$startdate['year']."-".$startdate['mon']."-".$startdate['mday'];
		$sql1 = "SELECT * FROM nhanxet ORDER BY ID DESC";
		$result1 = mysqli_query($conn, $sql1);
		$i=0;
		if(empty($_POST['ten']) || empty($_POST['nhanxet'])) $dem=0;
		else if (mysqli_num_rows($result1) > 0)
			{
   					 // output data of each row
				while($row = mysqli_fetch_assoc($result1))
				{	
					if($i==20) break;
					if($row['Ten']==$_POST['ten'] && $row['Nhanxet']==$_POST['nhanxet'])
					{
						
						$dem=1;
						break;
					}	
					$i++;
				}
			}

		if($dem!=1 && $dem!=0){
			echo $dem;
			$them = "INSERT INTO nhanxet(Ten, Sao, Nhanxet, Date) VALUES ('".$_POST['ten']."' , '".$_POST['sao']."' , '".$_POST['nhanxet']."', '".$dateMuon."')";
			$luu = mysqli_query($conn, $them);			
			$dem=2;
		}

		if($dem==1){
			echo"<div class='col-xs-12 col-sm-12 col-md-4 col-md-offset-8' style='color: red; font-size: 15px; font-style:Italic'>Tên và nhận xét đã tồn tại.</div>";

		}else if($dem==0){
			?>
			<div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-8" style="color: red; font-size: 15px; font-style:Italic">Tên và nhận xét không được để trống.</div>

			<?php
		}
	}

	?>
</div>
<div>
	<?php
	$sql1 = "SELECT * FROM nhanxet ORDER BY ID DESC";
	$result1 = mysqli_query($conn, $sql1);
	$i=1;
	if (mysqli_num_rows($result1) > 0)
	{
   					 // output data of each row
		while($row = mysqli_fetch_assoc($result1))
		{		
			if($i>20) break;
			else 
			{
				?>
				<div class="container" id="danhanxet">
					<div class="col-xs-5 col-sm-2 col-md-1">
						<img width="100" src="img/09.png">
					</div>
					<div class="col-xs-7 col-sm-3 col-md-3" id="danhanxetname">
						<div style="font-weight:bold; font-size:20px"><?php echo $row['Ten']?></div>
						<div>
							<?php 
							$sosao=$row['Sao'];
							while($sosao>0)
							{
								?>
								<img width="20" src="img/05.png">

								<?php
								$sosao--;
							}
							?>
						</div>
					</div>
					<div class="col-xs-12 col-sm-5 col-md-6" id="danhanxetnoidung">
						<?php
						echo $row['Nhanxet'];
						?>
					</div>
					<div class="col-xs-12 col-sm-2 col-md-2" id="danhanxetdate">
						<?php
						echo date("d-m-Y",strtotime($row["Date"]));
						?>
					</div>
					<?php
					if(isset($_SESSION['user']))
					{
						$id=$row['ID'];
					
							echo"<div class='col-xs-12 col-sm-12 col-md-12' style='text-align: right; font-size:15px'>";

								echo"<a href='xoa.php?id=$id'>Xóa</a>";
							echo"</div>";
					
					}

					?>
				</div>




				<?php
				$i++;
			}
		}
	}
	?>	
</div>


</body>
</html>