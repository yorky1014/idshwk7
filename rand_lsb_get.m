function result = rand_lsb_get(output,len_total,goalfile,key)
ste_cover=imread(output);
ste_cover=double(ste_cover);

[m,n]=size(ste_cover);
if len_total>m*n
  error('Ƕ����Ϣ������������ѡ��ͼ��');
end
frr=fopen(goalfile,'a');

p=1;

[row,col]=randinterval(ste_cover,len_total,key);
for i=1 :len_total
    if bitand(ste_cover(row(i),col(i)),1)==1
        fwrite(frr,1,'ubit1');
        result(p,1)=1;
    else
        fwrite(frr,0,'ubit1');
        result(p,1)=0;
    end
    if p ==len_total
        break;
    end
    p=p+1;
end
fclose(frr);
