<?php
defined('BASEPATH') or exit('No direct script access allowed');

class SuratMasuk extends CI_Controller
{
    public function index()
    {
        $data['title'] = 'Data Surat Masuk';
        $data['suratmasuk'] = $this->SuratMasuk_model->getAllSuratMasuk();
        $data['user'] = $this->db->get_where('tb_user', ['username' => $this->session->userdata('username')])->row_array();

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('surat_masuk/index', $data);
        $this->load->view('templates/footer');
    }

    public function tambah()
    {
        $data['title'] = 'Data Surat Masuk';
        $data['user'] = $this->db->get_where('tb_user', ['username' => $this->session->userdata('username')])->row_array();
        $data['status'] = ['Asli', 'Tebusan'];
        $data['sifat'] = ['Sangat Rahasia', 'Rahasia', 'Biasa'];
        $data['prioritas'] = ['Sangat Segera/Kilat', 'Segera', 'Biasa'];
        $data['jabatan'] = $this->Unit_model->getAlljabatan3();

        $this->form_validation->set_rules('no_surat', 'Nomor Surat', 'required');
        $this->form_validation->set_rules('tgl_surat', 'Tanggal Surat', 'required');
        $this->form_validation->set_rules('lampiran', 'Lampiran', 'required');
        $this->form_validation->set_rules('tgl_terima', 'Tanggal Diterima', 'required|callback_valid_tgl_terima');
        $this->form_validation->set_rules('no_agenda', 'Nomor Agenda', 'required');
        $this->form_validation->set_rules('dari', 'Dari', 'required');
        $this->form_validation->set_rules('kepada', 'Kepada', 'required');
        $this->form_validation->set_rules('perihal', 'Perihal', 'required');

        if ($this->form_validation->run() == TRUE) {
            $no_surat = $this->input->post('no_surat');
            if ($this->SuratMasuk_model->isNoSuratExists($no_surat)) {
                $this->session->set_flashdata('error', 'Nomor Surat sudah ada, silakan gunakan nomor lain.');
                redirect('SuratMasuk/tambah');
            } else {
                $config['upload_path']    = './assets/file/suratmasuk';
                $config['allowed_types']  = 'pdf|jpg|png';
                $config['max_size']       = '20000';

                $this->load->library('upload', $config);

                $this->upload->initialize($config);

                if ($this->upload->do_upload('userfile')) {
                    $this->SuratMasuk_model->tambahSuratMasuk($this->upload->data());

                    redirect('SuratMasuk');
                } else {
                    redirect('SuratMasuk/tambah');
                }
            }
        } else {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('surat_masuk/tambah', $data);
            $this->load->view('templates/footer');
        }
    }

    public function valid_tgl_terima($tgl_terima)
    {
        $tgl_surat = $this->input->post('tgl_surat');
        if (strtotime($tgl_terima) < strtotime($tgl_surat)) {
            $this->form_validation->set_message('valid_tgl_terima', 'Tanggal Diterima tidak boleh sebelum Tanggal Surat.');
            return false;
        }
        return true;
    }

    public function isNoSuratExists($no_surat)
    {
        $this->db->where('no_surat', $no_surat);
        $query = $this->db->get('tb_surat_masuk');
        return $query->num_rows() > 0;
    }

    public function edit($id_suratmasuk)
    {
        $data['title'] = 'Edit Surat Masuk';
        $data['user'] = $this->db->get_where('tb_user', ['username' => $this->session->userdata('username')])->row_array();
        $data['suratmasuk'] = $this->SuratMasuk_model->getSuratMasukById($id_suratmasuk);
        $data['status'] = ['Asli', 'Tebusan'];
        $data['sifat'] = ['Sangat Rahasia', 'Rahasia', 'Biasa'];
        $data['prioritas'] = ['Sangat Segera/Kilat', 'Segera', 'Biasa'];
        $data['jabatan'] = $this->Unit_model->getAlljabatan3();

        $this->form_validation->set_rules('no_surat', 'Nomor Surat', 'required');
        $this->form_validation->set_rules('tgl_surat', 'Tanggal Surat', 'required');
        $this->form_validation->set_rules('lampiran', 'Lampiran', 'required');
        $this->form_validation->set_rules('tgl_terima', 'Tanggal Diterima', 'required');
        $this->form_validation->set_rules('no_agenda', 'Nomor Agenda', 'required');
        $this->form_validation->set_rules('dari', 'Dari', 'required');
        $this->form_validation->set_rules('perihal', 'Perihal', 'required');

        if ($this->form_validation->run() == TRUE) {
            $config['upload_path']    = './assets/file/suratmasuk';
            $config['allowed_types']  = 'pdf|jpg|png';
            $config['max_size']       = '20000';

            $this->load->library('upload', $config);

            $this->upload->initialize($config);

            if ($this->upload->do_upload('userfile')) {
                $file = './assets/file/suratmasuk/' . $data['suratmasuk']['file'];

                if (is_readable($file) && unlink($file)) {
                    $this->SuratMasuk_model->editSuratMasukFile($this->upload->data());
                    redirect('SuratMasuk');
                }
            } else {
                $this->SuratMasuk_model->editSuratMasuk();
                redirect('SuratMasuk');
            }
        } else {
            $this->load->view('templates/header', $data);
            $this->load->view('templates/sidebar', $data);
            $this->load->view('templates/topbar', $data);
            $this->load->view('surat_masuk/edit', $data);
            $this->load->view('templates/footer');
        }
    }

    public function detail($id_suratmasuk)
    {
        $data['title'] = 'Detail Surat Masuk';
        $data['user'] = $this->db->get_where('tb_user', ['username' => $this->session->userdata('username')])->row_array();
        $data['suratmasuk'] = $this->SuratMasuk_model->getSuratMasukById($id_suratmasuk);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('surat_masuk/detail', $data);
        $this->load->view('templates/footer');
    }

    public function hapus($id_suratmasuk)
    {
        $data['suratmasuk'] = $this->SuratMasuk_model->getSuratMasukById($id_suratmasuk);
        $file = './assets/file/suratmasuk/' . $data['suratmasuk']['file'];

        if (is_readable($file) && unlink($file)) {
            $this->SuratMasuk_model->hapusSuratMasuk($id_suratmasuk);
            redirect('SuratMasuk');
        } else {
            echo "gagal";
        }
    }

    public function arsip($id_suratmasuk)
    {
        $this->SuratMasuk_model->arsipsurat();
        redirect('disposisi/suratmasukpengguna');
    }

    public function daftarsurat()
    {
        $data['title'] = 'Daftar Surat Masuk';
        $data['user'] = $this->db->get_where('tb_user', ['username' => $this->session->userdata('username')])->row_array();

        $this->load->library('pagination');

        if ($this->input->post('submit')) {
            $data['keyword'] = $this->input->post('keyword');
            $this->session->set_userdata('keyword', $data['keyword']);
        } else {
            $data['keyword'] = $this->session->userdata('keyword');
        }
        $config['base_url'] = 'http://localhost/e-office/suratmasuk/daftarsurat';
        $this->db->like('dari', $data['keyword']);
        $this->db->or_like('no_surat', $data['keyword']);
        $this->db->or_like('perihal', $data['keyword']);
        $this->db->from('tb_surat_masuk');
        $config['total_rows'] = $this->db->count_all_results();
        $config['per_page'] = 6;
        $data['total_rows'] = $config['total_rows'];

        $this->pagination->initialize($config);

        $data['start'] = $this->uri->segment(3);
        $data['suratmasuk'] = $this->SuratMasuk_model->getAllSuratMasukLaporan2($config['per_page'], $data['start'], $data['keyword']);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar', $data);
        $this->load->view('templates/topbar', $data);
        $this->load->view('surat_masuk/daftarsurat', $data);
        $this->load->view('templates/footer');
    }
}
