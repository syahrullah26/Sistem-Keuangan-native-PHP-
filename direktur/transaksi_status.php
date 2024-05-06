<?php
include '../koneksi.php';
$id  = $_GET['id'];
$status = $_GET['status'];
$ket_status='Di Tolak Oleh Rektor';

mysqli_query($koneksi, "update transaksi set status='$status' ,keterangan_status='$ket_status'  where transaksi_id='$id'");
header("location:transaksi.php");