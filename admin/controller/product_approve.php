<?php

    include "../../config/connect.php";

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;
    use PHPMailer\PHPMailer\SMTP;

    require '../../vendor/phpmailer/phpmailer/src/Exception.php';
    require '../../vendor/phpmailer/phpmailer/src/PHPMailer.php';
    require '../../vendor/phpmailer/phpmailer/src/SMTP.php';
    require '../../vendor/autoload.php';

    $pid=$_GET['p_id'];
    $product=mysqli_query($con,"SELECT * from products where p_id='$pid'");
    $data=mysqli_fetch_assoc($product);

    $product_name=$data['product_name'];
    $product_price=$data['price'];

    $email=$_GET['email'];
 /*
    $sql=mysqli_query($con,"SELECT * from bids INNER JOIN users on bids.u_id=users.u_id where bids.p_id='$pid'");
    
   if(mysqli_num_rows($sql) > 0){
    
        while($row=mysqli_fetch_assoc($sql)){
            $emails[]=$row['email'];
        }

        foreach($emails as $send){
            $sendmail=$send;
        }

        $update=mysqli_query($con,"UPDATE `products` SET `isApproved` = 'approve' WHERE `products`.`p_id`='$pid'");


    
 }*/

 $update=mysqli_query($con,"UPDATE `products` SET `isApproved` = 'approve' WHERE `products`.`p_id`='$pid'");
 if($update){
    $mail=new PHPMailer(true);

        $mail->IsSMTP();
        
        $mail->Mailer="smtp";

        $mail->SMTPDebug =0;
        $mail->SMTPAuth =TRUE;
        $mail->SMTPSecure ='tls';
        $mail->Port =587;
        $mail->Host ="smtp.gmail.com";
        $mail->Username ="mistrymadan699@gmail.com";
        $mail->Password ="qmskesryhgwkihzw";

        $mail->SetFrom('mistrymadan699@gmail.com','Auction System');
        $mail->addAddress($email);
                    // $mail->addAddress($email,$name);

        $mail->IsHTML(true);
        $mail->Subject ="Product Approve by Admin From Auction";
        $mail->Body ="Product Approve by Admin From Auction";
        $mail->AltBody ="$sendmail We Have Been approve $product_name for  Auction.";
        $mail->MsgHTML("<h1>$sendmail <br> We Have approve $product_name for Auction. <br> Bid For Another Products...</h1>
                        <br><br><br><br><br>
                        <h5>From:</h5>
                        <h3>Online Auction System</h3>");

                        if(!$mail->Send()){
                            echo "Error Sending Mail";
                        }
                        else{
                            header("location:../auctions.php");
                        }
        
}

          
    
?>
