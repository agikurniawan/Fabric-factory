<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->library('form_validation');
    }

    public function index(){

        $this->form_validation->set_rules('username', 'Username', 'trim|required');
        $this->form_validation->set_rules('password', 'Password', 'trim|required');

        if($this->form_validation->run() == false){
            $this->load->view('templates/gudang_header');
            $this->load->view('auth/login');
            $this->load->view('templates/gudang_footer');
        }else{
            //validasi sukses
            $this->__login();
        }
    }

    private function __login(){
        $username = $this->input->post('username');
        $password = $this->input->post('password');

        $user = $this->db->get_where('user', ['username' => $username])->row_array();
        
        if($user){
            if($user['is_active'] == 1){

                if(password_verify($password, $user['password'])){
                    $data = [
                        'username' => $user['username'],
                        'role_id' => $user['role_id']
                    ];

                    $this->session->set_userdata($data);

                    if($user['role_id'] == 1){
                        redirect('gudang');

                    }else if($user['role_id'] == 2){
                        redirect('kasir');
                        
                    }else{
                        redirect('pembuat');
                    }
                    
                }else{
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Wrong password!</div>');
                    redirect('auth');
                }

            }else{
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">This Username has not been activated!</div>');
                redirect('auth');
            }
        }else{
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Username not registered!</div>');
            redirect('auth');
        }
    }

    public function register(){
        $this->form_validation->set_rules('name','Name','required|trim');
        $this->form_validation->set_rules('username','Username','required|trim');
        $this->form_validation->set_rules('email','Email','required|trim|valid_email|is_unique[user.email]',[
            'is_unique' => 'This email has already registered!'
        ]);
        $this->form_validation->set_rules('password1','Password','required|trim|min_length[3]|matches[password2]', [
            'matches' => 'Password dont match!',
            'min_length' => 'Password too short!'
        ]);
        $this->form_validation->set_rules('password2','Password','required|trim|matches[password1]');

        if( $this->form_validation->run() == false){

            $this->load->view('templates/gudang_header');
            $this->load->view('auth/register');
            $this->load->view('templates/gudang_footer');
        }else{
            $data = [
                'name' => htmlspecialchars($this->input->post('name', true)),
                'username' => htmlspecialchars($this->input->post('username',true)),
                'password' => password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
                'email' => $this->input->post('email'),
                'image' => 'default.jpg',
                'role_id' => 2,
                'is_active' => 1,
                'date_created' => time()
            ];

            $this->db->insert('user', $data);
            $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Congratulation! Your account has been created. Please login</div>');
            redirect('auth');
        }
        
    }

    public function logout(){
        $this->session->unset_userdata('username');
        $this->session->unset_userdata('role_id');

        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">You have been logged out!</div>');
            redirect('auth');
    }

}