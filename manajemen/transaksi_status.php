<?php
include '../koneksi.php';
$id  = $_GET['id'];
$status = $_GET['status'];
if ($status=='terima'){
    $ket_status='Di Terima Oleh Manajemen';
}
else{
    $ket_status='Di Tolak Oleh Manajemen';
}

mysqli_query($koneksi, "update transaksi set status='$status', keterangan_status='$ket_status' where transaksi_id='$id'");
header("location:transaksi.php");