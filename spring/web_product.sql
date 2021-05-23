insert into products_info(product_id, file_pictureId, product_manufacturer, product_name, product_category, product_color) values (products_sequence.nextval, '23', 'apple', 'ipad','tablet', '#dfe6e9');


insert into common_file(file_pictureId, file_name, file_uuid, file_uploadPath, file_type, file_usingType) 
    values (file_sequence.nextval, 'name','uuid', 'src', 'image', '3');
    
    commit;

select * from common_file;

select * from products_info;