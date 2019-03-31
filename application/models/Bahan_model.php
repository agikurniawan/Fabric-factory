<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bahan_model extends CI_Model {

    public function getBahan_model(){
        $query = "SELECT `data_barang`.*, `bahan`.`bahan`  
                FROM `data_barang` JOIN `bahan`
                ON `data_barang`.`bahan_id` = `bahan`.`id` 
                ";

        return $this->db->query($query)->result_array();
    }

}