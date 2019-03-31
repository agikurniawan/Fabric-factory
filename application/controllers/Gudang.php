<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gudang extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
    }

    public function index()
    {
        $data['title'] = 'Dashboard';
        $data['user'] = $this->db->get_where('user', ['username' => $this->session->userdata('username')])->row_array(); 

        $data['barang'] = $this->db->get('data_barang')->result_array();
        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('gudang/index', $data);
        $this->load->view('templates/footer');
    }

    public function persediaan(){
        $data['title'] = 'Persediaan';
        $data['user'] = $this->db->get_where('user', ['username' => $this->session->userdata('username')])->row_array();

        $this->load->model('Bahan_model', 'bahan');

        $data['bahan'] = $this->bahan->getBahan_model();
        
        $data['barang'] = $this->db->get('data_barang')->result_array();
        $data['jbahan'] = $this->db->get('bahan')->result_array();

        $this->form_validation->set_rules('name', 'Name', 'required');
        $this->form_validation->set_rules('bahan_id', 'Bahan_id', 'required');
        $this->form_validation->set_rules('stock', 'Stock', 'required');
        $this->form_validation->set_rules('status', 'Status', 'required');
        $this->form_validation->set_rules('sisa', 'Sisa', 'required');

        
        if($this->form_validation->run() == false){
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('gudang/persediaan', $data);
            $this->load->view('templates/footer');

        }else{
            $data = [
                'name' => $this->input->post('name'),
                'bahan_id' => $this->input->post('bahan_id'),
                'stock' => $this->input->post('stock'),
                'status' => $this->input->post('status'),
                'sisa' => $this->input->post('sisa'),
            ];
            $this->db->insert('data_barang', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Barang Berhasil Di Tambahkan!</div>');
            redirect('gudang/persediaan');
        }
    }


}