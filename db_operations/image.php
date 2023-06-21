<?php
    
    //Profile Pic
    $profile_pic=$_FILES['profile_pic']['name']; //Getting img name
    $profile_size=$_FILES['profile_pic']['size']; //Getting img size
    $profile_tmpname=$_FILES['profile_pic']['tmp_name'];
    $profile_type=$_FILES['profile_pic']['type']; //Getting img type
    $profile_explode=explode('.',$_FILES['profile_pic']['name']); //Getting img extension
    $profile_extension=strtolower(end($profile_pic));

    //QRCode
    $qrcode=$_FILES['qrcode']['name'];
    $qrcodesize=$_FILES['qrcode']['size'];
    $qrcodetmpname=$_FILES['qrcode']['tmp_name'];
    $qrcodetype=$_FILES['qrcode']['type'];
    $qrcode_explode=explode('.',$_FILES['qrcode_pic']['name']);
    $qrcode_extension=strtolower(end($qrcode));

    //image extensions
    $extensions=array("jpeg","jpg","png");  //Valid Image Uploading Extensions
    //folder path for image uploads
    $profilefolder="/usr_imgs/profile/".$profile_pic;
?>