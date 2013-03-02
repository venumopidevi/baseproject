<?php

/* Source message model
 * It keeps list of available strings/labels with default value in
 * english language. 
 */

class SourceMessage extends CActiveRecord {

  /**
   * @return SourceMessage
   */
  public static function model($className = __CLASS__) {
    return parent::model(__CLASS__);
  }

  /**
   * @return string Table name
   */
  public function tableName() {
    return 'SourceMessage';    
  }

}