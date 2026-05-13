REPORT ztaner_kisi_list.

TYPES: BEGIN OF ty_kisi,
         kisi_id TYPE numc10,
         ad      TYPE ztaner_ad,
         soyad   TYPE ztaner_soyad,
         telefon TYPE ztaner_tel,
       END OF ty_kisi.

DATA: lt_kisi TYPE TABLE OF ty_kisi,
      ls_kisi TYPE ty_kisi.

START-OF-SELECTION.

  SELECT kisi_id ad soyad telefon
    INTO TABLE lt_kisi
    FROM ztaner_kisi.

  IF lt_kisi IS INITIAL.
    WRITE: / 'Tabloda kayıt bulunamadı.'.
  ELSE.
    WRITE: /1 'ID',
            15 'Ad',
            70 'Soyad',
            125 'Telefon'.
    ULINE.
    LOOP AT lt_kisi INTO ls_kisi.
      WRITE: /1 ls_kisi-kisi_id,
              15 ls_kisi-ad,
              70 ls_kisi-soyad,
              125 ls_kisi-telefon.
    ENDLOOP.
  ENDIF.
