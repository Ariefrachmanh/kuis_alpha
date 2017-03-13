<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pegawai_Model extends CI_Model {

		public function __construct()
		{
			parent::__construct();
			//Do your magic here
		}	

		public function getDataPegawai()
		{
			$query = $this->db->get('pegawai');
			return $query->result_array();
		}

		public function getJabatanByPegawai($idPegawai)
		{			
			$this->db->select('*');
			$this->db->from('jabatan_pegawai');
			$this->db->join('pegawai', 'pegawai.id = jabatan_pegawai.fk_pegawai');
			$this->db->where('pegawai.id', $idPegawai);
			$query = $this->db->get();
			return $query->result_array();
		}
		public function getAnakByPegawai($idPegawai)
		{
			$this->db->select('anak.nama AS nama_anak, anak.tanggalLahir, pegawai.nama');
			$this->db->from('anak');
			$this->db->join('pegawai', 'pegawai.id = anak.fk_pegawai');
			$this->db->where('pegawai.id', $idPegawai);
			$query = $this->db->get();
			return $query->result_array();
		}

}

/* End of file Pegawai_Model.php */
/* Location: ./application/models/Pegawai_Model.php */
 ?>