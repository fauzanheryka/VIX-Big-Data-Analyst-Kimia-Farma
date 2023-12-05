CREATE TABLE base_table AS(SELECT
						   	pjl.id_invoice ||''|| pjl.id_barang AS id_penjualan,
						  	pjl.id_distributor,
						   	pjl.id_cabang,
						   	pjl.id_invoice,
						   	date(pjl.tanggal) as tanggal,
						   	pjl.id_customer,
						   	pjl.id_barang,
						   	pjl.jumlah_barang,
						   	pjl.unit,
						   	pjl.harga,
						   	pjl.mata_uang,
						   	pjl.brand_id,
						   	brg.kode_lini,
						   	INITCAP(pjl.lini) AS nama_merk,
						   	INITCAP(pjl.nama_barang) as nama_barang,
						   	plg.level,
						   	INITCAP(plg.nama) as nama_cabang,
						   	plg.id_cabang_sales,
						   	INITCAP(plg.cabang_sales) as lokasi_cabang,
						   	INITCAP(plg.grup) as grup,
						   	brg.sektor,
						   	brg.tipe,
						   	brg.kemasan,
						   	brg.nama_tipe
						   FROM penjualan AS pjl
						   LEFT JOIN pelanggan AS plg ON plg.id_customer = pjl.id_customer
						   left join barang as brg on pjl.id_barang = brg.kode_barang
						   order by pjl.tanggal
						   );
--- set primary key
ALTER TABLE base_table 
ADD PRIMARY KEY(id_penjualan);