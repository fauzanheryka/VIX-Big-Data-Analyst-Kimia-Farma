--- create table
CREATE TABLE penjualan(
	id_distributor varchar,
	id_cabang varchar,
	id_invoice varchar,
	tanggal timestamp,
	id_customer varchar,
	id_barang varchar,
	jumlah_barang int,
	unit varchar,
	harga double precision,
	mata_uang varchar,
	brand_id varchar,
	lini varchar,
	nama_barang varchar
) ;

CREATE TABLE pelanggan(
	id_customer VARCHAR,
	level VARCHAR,
	nama VARCHAR,
	id_cabang_sales VARCHAR,
	cabang_sales VARCHAR,
	id_distributor VARCHAR,
	grup VARCHAR );
	
CREATE TABLE barang(
	kode_barang varchar,
	sektor varchar,
	nama_barang varchar,
	tipe varchar,
	nama_tipe varchar,
	kode_lini varchar,
	lini varchar,
	kemasan varchar
);
	
--- import dataset
COPY penjualan(
	id_distributor,
	id_cabang,
	id_invoice,
	tanggal,
	id_customer,
	id_barang,
	jumlah_barang,
	unit,
	harga,
	mata_uang,
	brand_id,
	lini,
	nama_barang
)
FROM 'C:\users\downloads\kimia farma\penjualan.csv'
DELIMITER ','
CSV HEADER;

COPY pelanggan(
	id_customer,
	level,
	nama,
	id_cabang_sales,
	cabang_sales,
	id_distributor,
	grup
)
FROM 'C:\users\downloads\kimia farma\pelanggan.csv'
DELIMITER ','
CSV HEADER;