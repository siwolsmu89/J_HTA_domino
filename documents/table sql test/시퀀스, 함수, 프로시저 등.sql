-- 등급 테이블을 제외한 모든 테이블의 pk는 3자리 수의 시퀀스로 생성한다.
CREATE SEQUENCE answer_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE branch_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE location_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE etc_order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE etc_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE event_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE pizza_order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE pizza_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE question_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE side_order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE side_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE topping_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE topping_order_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;
CREATE SEQUENCE user_no_seq START WITH 100 INCREMENT BY 1 NOCACHE;