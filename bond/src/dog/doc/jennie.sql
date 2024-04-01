-- ���� �Խ���

CREATE TABLE gboard(
    gno NUMBER(4)
        CONSTRAINT GBD_NO_PK PRIMARY KEY,
    writer NUMBER(4)
        CONSTRAINT GBD_MNO_FK REFERENCES member(mno)
        CONSTRAINT GBD_MNO_UK UNIQUE
        CONSTRAINT GBD_MNO_NN NOT NULL,
    body VARCHAR2(100 CHAR)
        CONSTRAINT GBD_BD_NN NOT NULL,
    wdate DATE DEFAULT sysdate
        CONSTRAINT GBD_DATE_NN NOT NULL
);

-- ���� ������ ����
CREATE SEQUENCE gbrdSeq
    START WITH 1001
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
;

-- ������ �߰�
INSERT INTO
    gboard(gno, writer, body)
VALUES(
    gbrdSeq.NEXTVAL, 1000, '����Ʈ �������״� �˾Ƽ� �� �Ͷ�!!!'
);

INSERT INTO
    gboard(gno, writer, body)
VALUES(
    gbrdSeq.NEXTVAL, 1001, '��������'
);

INSERT INTO
    gboard(gno, writer, body)
VALUES(
    gbrdSeq.NEXTVAL, 1067, '�Ƴ� �ǰ���!!!!!!'
);

commit;

SELECT
    gno, name, id, body, filename sname, wdate
FROM
    member, avatar, gboard
WHERE
    writer = mno
    AND avatar = ano
ORDER BY
    wdate desc
;

-- �α����� ����� �ۼ��� ������ �� ���� ��ȸ

-- 'jennie'�� �ۼ��� ���� �� ���� ��ȸ
SELECT
    count(*) cnt
FROM
    member, gboard
WHERE
    id='jennie'
    and mno = writer
;







