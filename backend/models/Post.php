<?php

class Post extends CActiveRecord
{
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	public function tableName()
	{
		return 'user';
	}

	public function rules()
	{
		return array(
			array('requires_new_password, login_attempts, login_time, create_id, create_time, update_id, update_time', 'numerical', 'integerOnly'=>true),
			array('username', 'length', 'max'=>45),
			array('password, salt, email, validation_key', 'length', 'max'=>255),
			array('password_strategy', 'length', 'max'=>50),
			array('login_ip', 'length', 'max'=>32),
			array('id, username, password, salt, password_strategy, requires_new_password, email, login_attempts, login_time, login_ip, validation_key, create_id, create_time, update_id, update_time', 'safe', 'on'=>'search'),
		);
	}

	public function relations()
	{
		return array(
		);
	}

	public function behaviors()
	{
		return array('CAdvancedArBehavior',
				array('class' => 'ext.CAdvancedArBehavior')
				);
	}

	public function attributeLabels()
	{
		return array(
			'id' => Yii::t('app', 'ID'),
			'username' => Yii::t('app', 'Username'),
			'password' => Yii::t('app', 'Password'),
			'salt' => Yii::t('app', 'Salt'),
			'password_strategy' => Yii::t('app', 'Password Strategy'),
			'requires_new_password' => Yii::t('app', 'Requires New Password'),
			'email' => Yii::t('app', 'Email'),
			'login_attempts' => Yii::t('app', 'Login Attempts'),
			'login_time' => Yii::t('app', 'Login Time'),
			'login_ip' => Yii::t('app', 'Login Ip'),
			'validation_key' => Yii::t('app', 'Validation Key'),
			'create_id' => Yii::t('app', 'Create'),
			'create_time' => Yii::t('app', 'Create Time'),
			'update_id' => Yii::t('app', 'Update'),
			'update_time' => Yii::t('app', 'Update Time'),
		);
	}

	public function search()
	{
		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);

		$criteria->compare('username',$this->username,true);

		$criteria->compare('password',$this->password,true);

		$criteria->compare('salt',$this->salt,true);

		$criteria->compare('password_strategy',$this->password_strategy,true);

		$criteria->compare('requires_new_password',$this->requires_new_password);

		$criteria->compare('email',$this->email,true);

		$criteria->compare('login_attempts',$this->login_attempts);

		$criteria->compare('login_time',$this->login_time);

		$criteria->compare('login_ip',$this->login_ip,true);

		$criteria->compare('validation_key',$this->validation_key,true);

		$criteria->compare('create_id',$this->create_id);

		$criteria->compare('create_time',$this->create_time);

		$criteria->compare('update_id',$this->update_id);

		$criteria->compare('update_time',$this->update_time);

		return new CActiveDataProvider(get_class($this), array(
			'criteria'=>$criteria,
		));
	}
}
