.model small
.code
org 100h
start:
	jmp mulai
nama		db 13,10,'Nama Anda		    : $'
no_hp		db 13,10,'No. HP/Telp		  : $'
alamat		db 13,10,'alamat'
berangkat	db 13,10,'berangkat dari	: $'
tujuan		db 13,10,'tujuan'
lanjut		db 13,10,'LANJUT Tekan y untuk lanjut >>>>>>>>>> $'
tampung_nama	db 30,?,30 dup(?)
tampung_hp		db 13,?,13 dup(?)   

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j db 15   

daftar		db 13,10, '-------------------------------------------------------+'
		    db 13,10, '|                DAFTAR HARGA MOBIL RENTAL             |'
	    	db 13,10, '+----+--------------------------+----------------------+'
		    db 13,10, '|No | TIPE MOBIL     |    PER HARI  |   (+)SOPIR       |'
		    db 13,10, '+----+--------------------------+----------------------+'
	    	db 13,10, '|01 | HIACE          |Rp. 1.200.000 | Rp.1.350.000,00  |'
		    db 13,10, '+----+--------------------------+----------------------+'
	    	db 13,10, '|02 | INNOVA REBORN  |Rp. 650.000,00| Rp. 750.000,00   |'
		    db 13,10, '+----+---------------------------+---------------------+'
	    	db 13,10, '|03 | MOBIL INNOVA   |Rp. 550.000,00| Rp. 650.000,00   |'
		    db 13,10, '+----+--------------------------+----------------------+'
	    	db 13,10, '|04 | MOBIL AVANZA   |RP. 450.00.000| Rp. 550.000,00   |'
		    db 13,10, '+----+---------------------------+---------------------+'
		    db 13,10, '|05 | MOBIL XENIA    |Rp. 350.000,00| Rp. 450.000,00   |'
		    db 13,10, '+----+--------------------------+----------------------+'

			db 13,10, 'Nama Anda						   : $'
				db 13,10, 'No hp					       : $'
				db 13,10, 'Alamat	                       : $'	
				db 13,10, 'Berangkat dari				   : $'
				db 13,10, 'Tujuan                          : $'
				                          
error			db 13,10, 'KODE YANG ANDA MASUKAN SALAH $'
pilih_MOBIL		db 13,10, 'Silahkan masukan kode no/kode MOBIL yang anda pilih : $'
success			db 13,10, 'Anda Berhasil Memasukan kode $'  


mulai:
    mov ah,09h
    lea dx,nama
    int 21h
    mov ah,0ah
    lea dx,tampung_nama
    int 21h
    push dx  
    
    mov ah,09h
    lea dx,no_hp
    int 21h
    mov ah,0ah
    lea dx,tampung_hp
    int 21h
    push dx


    mov ah,09h
    mov dx,offset daftar
    int 21h
    mov ah,09h
    mov dx,offset lanjut
    int 21h 
    mov ah,01h
    int 21h
    cmp al,'y'  
    je  proses
    jne error_msg 
    

error_msg:
	mov ah,09h
	mov dx,offset error
	int 21h 
	
	

proses:
	mov ah,09h
	mov dx,offset pilih_MOBIL
	int 21h

	mov ah,1
	int 21h
	mov bh,al 
	mov ah,1
	int 21h
	mov bl,al
	cmp bh, '0'
	cmp bl, '1'
	je hasil1

	cmp bh, '0'
	cmp bl, '2'
	je hasil2

	cmp bh, '0'
	cmp bl, '3'
	je hasil3

	cmp bh, '0'
	cmp bl, '4'
	je hasil4

	cmp bh, '0'
	cmp bl, '5'
	je hasil5
	
	

	jne error_msg

;-------------------------------------------------------------------------------------------------

Hasil1:
	mov ah,09h
	lea dx, teks1
	int 21h
	int 20h

Hasil2:
	mov ah,09h
	lea dx, teks2
	int 21h
	int 20h

Hasil3:
	mov ah,09h
	lea dx, teks3
	int 21h
	int 20h

Hasil4:
	mov ah,09h
	lea dx, teks4
	int 21h
	int 20h

Hasil5:
	mov ah,09h
	lea dx, teks5
	int 21h
	int 20h


;--------------------------------------------------------------------------------------------







Teks1	db 13,10, 'Anda Memilih MOBIL HIACE'
		db 13,10, 'Nama : ALYA MAHA'
		db 13,10, 'Alamat : YOGYAKARTA'
		db 13,10, 'No. HP/Telp : 0893922345'
		db 13,10, 'Berangkat dari Sleman'
		db 13,10, 'Tujuan Pantai Gunung Kidul'
		
	db 13,10, 'Biaya Sewa PER HARI 1.200.000'
	db 13,10, 'Jika menggunakan sopir 1.350.000'
	db 13,10, 'Terimakasih $'

Teks2	db 13,10, 'Anda Memilih MOBIL INNOVA REBORN'
		db 13,10, 'Nama : ALYA MAHA'
		db 13,10, 'Alamat : YOGYAKARTA'
		db 13,10, 'No. HP/Telp : 0893922345'
		db 13,10, 'Berangkat dari Sleman'
		db 13,10, 'Tujuan Pantai Gunung Kidul'
		
	db 13,10, 'Biaya Sewa PER HARI 650.000'
	db 13,10, 'Jika menggunakan sopir 750.000'
	db 13,10, 'Terimakasih $'

Teks3	db 13,10, 'Anda Memilih MOBIL INNOVA'
		db 13,10, 'Nama : ALYA MAHA'
		db 13,10, 'Alamat : YOGYAKARTA'
		db 13,10, 'No. HP/Telp : 0893922345'
		db 13,10, 'Berangkat dari Sleman'
		db 13,10, 'Tujuan Pantai Gunung Kidul'
		
	db 13,10, 'Biaya Sewa PER HARI 550.000'
	db 13,10, 'Jika menggunakan sopir 650.000'
	db 13,10, 'Terimakasih $'

Teks4	db 13,10, 'Anda Memilih MOBIL INNOVA REBORN'
		db 13,10, 'Nama : ALYA MAHA'
		db 13,10, 'Alamat : YOGYAKARTA'
		db 13,10, 'No. HP/Telp : 0893922345'
		db 13,10, 'Berangkat dari Sleman'
		db 13,10, 'Tujuan Pantai Gunung Kidul' 
		
	db 13,10, 'Biaya Sewa PER HARI 450.000'
	db 13,10, 'Jika menggunakan sopir 550.000'
	db 13,10, 'Terimakasih $'

Teks5	db 13,10, 'Anda Memilih MOBIL INNOVA REBORN'
		db 13,10, 'Nama : ALYA MAHA'
		db 13,10, 'Alamat : YOGYAKARTA'
		db 13,10, 'No. HP/Telp : 0893922345'
		db 13,10, 'Berangkat dari Sleman'
		db 13,10, 'Tujuan Pantai Gunung Kidul'
		
	db 13,10, 'Biaya Sewa PER HARI 350.000'
	db 13,10, 'Jika menggunakan sopir 450.000'
	db 13,10, 'Terimakasih $'
	

end start

	
	


