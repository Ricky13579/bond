-- 방명록 게시판

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

-- 방명록 시퀀스 생성
CREATE SEQUENCE gbrdSeq
    START WITH 1001
    MAXVALUE 9999
    NOCYCLE
    NOCACHE
;

-- 데이터 추가
INSERT INTO
    gboard(gno, writer, body)
VALUES(
    gbrdSeq.NEXTVAL, 1000, '사이트 오픈할테니 알아서 쳐 와라!!!'
);

INSERT INTO
    gboard(gno, writer, body)
VALUES(
    gbrdSeq.NEXTVAL, 1001, '축하해유'
);

INSERT INTO
    gboard(gno, writer, body)
VALUES(
    gbrdSeq.NEXTVAL, 1067, '아냐 피곤해!!!!!!'
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

-- 로그인한 사람이 작성한 방명록의 글 개수 조회

-- 'jennie'가 작성한 방명록 글 개수 조회
SELECT
    count(*) cnt
FROM
    member, gboard
WHERE
    id='jennie'
    and mno = writer
;







