mailbox 表新增字段

DROP PROCEDURE IF EXISTS mailbox_column_update;
CREATE PROCEDURE mailbox_column_update() BEGIN
    -- 新增删除标志列
    IF NOT EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='cbs' AND table_name='mailbox' AND COLUMN_NAME='delete_flag') THEN
            ALTER TABLE mailbox ADD   delete_flag  int  DEFAULT 2   NOT NULL;
    END IF;
    -- 新增删除日期列
    IF NOT EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='cbs' AND table_name='mailbox' AND COLUMN_NAME='delete_date') THEN
            ALTER TABLE mailbox ADD  delete_date  int  DEFAULT 0   NOT NULL;
    END IF;
    -- 如果存在字段account_mail，则修改字段长度
    IF EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA='cbs' AND table_name='mailbox' AND COLUMN_NAME='email_account')
    THEN
        alter table mailbox modify column email_account varchar(320);
    END IF;
    -- 如果不存在主键列，则设置双主键
    IF ((SELECT count(*) FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA ='cbs' AND table_name='mailbox' AND CONSTRAINT_NAME ='PRIMARY' AND (COLUMN_NAME ='email_account' OR COLUMN_NAME = 'company_id'))=0)THEN
                ALTER TABLE mailbox ADD primary key (company_id,email_account);
    -- 如果只存在一个主键列
    ELSEIF ((SELECT count(*) FROM information_schema.KEY_COLUMN_USAGE WHERE TABLE_SCHEMA ='cbs' AND table_name='mailbox' AND CONSTRAINT_NAME ='PRIMARY' AND (COLUMN_NAME ='email_account' OR COLUMN_NAME = 'company_id'))<2)THEN
                ALTER TABLE mailbox  DROP PRIMARY KEY,ADD primary key (company_id,email_account);
    END IF;
        
END;
CALL mailbox_column_update();
DROP PROCEDURE IF EXISTS mailbox_column_update;