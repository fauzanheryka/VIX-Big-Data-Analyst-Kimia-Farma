create table agg_table as(SELECT
	id_penjualan,
	tanggal,
    to_char(tanggal, 'month') as bulan,
	lokasi_cabang,
    nama_cabang,
	grup,
    nama_barang,
    nama_merk,
    jumlah_barang AS jumlah_produk_terjual,
    harga AS harga_satuan,
    round(SUM(jumlah_barang * CAST(harga AS int))) AS total_revenue,
	case 
		when SUM(jumlah_barang * CAST(harga AS int)) <=34726 then 'Low spender'
		when SUM(jumlah_barang * CAST(harga AS int)) between 34727 and 70475 then 'Medium spender' --- base on percentiles 0.25,0.5,.75
		else 'High spender'
		end as spending_bucket
FROM base_table
GROUP BY 1,2,3,4,5,6,7,8,9
order by 2);

