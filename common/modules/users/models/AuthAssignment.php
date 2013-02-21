<?php
/**
 * auth item child model
 */
class AuthAssignment extends CActiveRecord
{
	/**
	 * @return object
	 */
	public static function model($className = __CLASS__)
	{
		return parent::model(__CLASS__);
	}
	
	/**
	 * @return string Table name
	 */
	public function tableName()
	{
		return 'AuthAssignment';
	}	
}