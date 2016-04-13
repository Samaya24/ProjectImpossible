CREATE TABLE dbo.user_details (
    id int not null identity,
	user_id        VARCHAR (50)  NOT NULL,
    first_name     VARCHAR (100) NOT NULL,
    last_name      VARCHAR (100) NOT NULL,
    phone_no       VARCHAR (50)  NOT NULL,
    street_address VARCHAR (100) NOT NULL,
    city           VARCHAR (50)  NOT NULL,
    state_address  VARCHAR (50)  NOT NULL,
    country        VARCHAR (50)  NOT NULL,
    pin            VARCHAR (50)  NOT NULL,
    subscription   VARCHAR (5)   NOT NULL,
    CONSTRAINT PK_user_details PRIMARY KEY (id),
	CONSTRAINT AK_user_details UNIQUE (user_id)
);

CREATE TABLE dbo.user_login_details (
    id int NOT NULL IDENTITY,
	user_id  VARCHAR (50) NOT NULL,
    password VARCHAR (50) NOT NULL,
	sec_question1 VARCHAR(MAX) NOT NULL, 
    answer1 VARCHAR(MAX) NULL, 
    sec_question2 VARCHAR(MAX) NULL, 
    answer2 VARCHAR(MAX) NULL, 
    sec_question3 VARCHAR(MAX) NULL,
	CONSTRAINT PK_USER_LOGIN_DETAILS PRIMARY KEY (id),
    CONSTRAINT FK_user_login_details FOREIGN KEY (user_id) REFERENCES dbo.user_details (user_id)
);

CREATE TABLE DBO.PURCHASE_USER(
	PURCHASE_ID INT NOT NULL IDENTITY,
	USER_ID VARCHAR (50) NOT NULL,
	NO_OF_PIXELS INT NOT NULL,
	START_PIXEL INT NOT NULL,
	END_PIXEL INT NOT NULL,
	CONSTRAINT PK_PURCHASE_DETAILS PRIMARY KEY (PURCHASE_ID),
	CONSTRAINT FK_PURCHASE_DETAILS FOREIGN KEY (USER_ID) REFERENCES DBO.USER_DETAILS (USER_ID)
);

INSERT INTO USER_DETAILS VALUES ('1','srikargr@gmail.com','shreekar','gr','606 hovey','normal','illinois','usa','61761','no');